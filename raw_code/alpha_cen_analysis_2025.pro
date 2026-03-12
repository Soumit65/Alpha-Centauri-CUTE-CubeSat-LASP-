;This program is to analyze the CUTE Alpha Cen data with the new calibration curve from 2025
PRO ALPHA_CEN_ANALYSIS_2025

visit = ['1','2','3','4','5','6','7','8','9','10']   ;Create an array of all the visits
nvis  = N_ELEMENTS(visit)       ;Number of elements in the visit array
miss_pack = ''
READ,"Do you want to do the missing packet correction (Y/N)? ",miss_pack

IF miss_pack EQ 'Y' THEN BEGIN
  ;Read in the science frames and correct the observation files for missing packets
  FOR i=0, nvis-1 DO BEGIN
    vis       = STRCOMPRESS('Visit'+visit[i])
    scfiles   = FILE_SEARCH('/Users/dobh6980/Projects/Kevin_projects/CUTE/Alpha_cen/2025/'+vis+'/Science/*.fits')
    nscfiles  = N_ELEMENTS(scfiles)
    IF visit[i] EQ '1' THEN nfiles1 = nscfiles
    IF visit[i] EQ '2' THEN nfiles2 = nscfiles
    IF visit[i] EQ '3' THEN nfiles3 = nscfiles
    IF visit[i] EQ '4' THEN nfiles4 = nscfiles
    IF visit[i] EQ '5' THEN nfiles5 = nscfiles
    IF visit[i] EQ '6' THEN nfiles6 = nscfiles
    IF visit[i] EQ '7' THEN nfiles7 = nscfiles
    IF visit[i] EQ '8' THEN nfiles8 = nscfiles
    IF visit[i] EQ '9' THEN nfiles9 = nscfiles
    IF visit[i] EQ '10' THEN nfiles10 = nscfiles
    FOR j=0, nscfiles-1 DO BEGIN
      file   = scfiles[j]
      ffstr  = STRSPLIT(file,'/',/EXTRACT)
      fname  = ffstr[9]
      strnam = STRSPLIT(fname,'_',/EXTRACT)
      npkts  = FIX(FLOAT(strnam[13]))
      result = READFITS(file,header)
      ind    = WHERE(result EQ 0.0)
      img    = result
      IF (MAX(ind) GT 0) AND (npkts LT 446) THEN BEGIN
        nele     = N_ELEMENTS(ind)
        FOR k=0, nele-1 DO BEGIN
          index = ARRAY_INDICES(img,ind[k])
          xpos  = index[0]
          ypos  = index[1]
          IF (xpos GT 0.0) AND (ypos GT 0.0) AND (xpos LT 2199) AND (ypos LT 99) THEN BEGIN
            IF (visit[i] EQ '4') AND (j EQ 16) THEN BEGIN
              topval         = LONG(img[xpos,ypos+1])
              botval         = LONG(img[xpos,ypos-1])
            ENDIF ELSE BEGIN
              topval         = LONG(img[xpos,ypos+2])
              botval         = LONG(img[xpos,ypos-2])
            ENDELSE
            val            = 0.5*(topval+botval)
            img[xpos,ypos] = val
          ENDIF
        ENDFOR
      ENDIF
      folder = STRCOMPRESS('/Users/dobh6980/Projects/Kevin_projects/CUTE/Alpha_Cen/2025/'+vis+'/Science/processed/'+fname)
      WRITEFITS,folder,img,header  ;This is to check if all the missing pixels have been replaced correctly
    ENDFOR
  ENDFOR
ENDIF ELSE BEGIN
  FOR i=0, nvis-1 DO BEGIN
    vis       = STRCOMPRESS('Visit'+visit[i])
    scfiles   = FILE_SEARCH('/Users/dobh6980/Projects/Kevin_projects/CUTE/Alpha_cen/2025/'+vis+'/Science/processed/*.fits')
    nscfiles  = N_ELEMENTS(scfiles)
    IF visit[i] EQ '1' THEN nfiles1 = nscfiles
    IF visit[i] EQ '2' THEN nfiles2 = nscfiles
    IF visit[i] EQ '3' THEN nfiles3 = nscfiles
    IF visit[i] EQ '4' THEN nfiles4 = nscfiles
    IF visit[i] EQ '5' THEN nfiles5 = nscfiles
    IF visit[i] EQ '6' THEN nfiles6 = nscfiles
    IF visit[i] EQ '7' THEN nfiles7 = nscfiles
    IF visit[i] EQ '8' THEN nfiles8 = nscfiles
    IF visit[i] EQ '9' THEN nfiles9 = nscfiles
    IF visit[i] EQ '10' THEN nfiles10 = nscfiles
    FOR j=0, nscfiles-1 DO BEGIN
      file   = scfiles[j]
      result = READFITS(file,header)
      IF j EQ 0 THEN BEGIN
        ss               = SIZE(result)
        xdim             = ss[1]
        ydim             = ss[2]
        ss2              = SIZE(header)
        hdim             = ss2[1]
        IF visit[i] EQ '1' THEN BEGIN
          sc_img_arr1       = FLTARR(nscfiles,xdim,ydim)
          head_arr_sc1      = STRARR(nscfiles,hdim)
          jd_arr1           = DBLARR(nscfiles)
          date_obs1         = STRARR(nscfiles)
          rad_temp1         = DBLARR(nscfiles)
          ccd_temp1         = DBLARR(nscfiles)
        ENDIF
        IF visit[i] EQ '2' THEN BEGIN
          sc_img_arr2       = FLTARR(nscfiles,xdim,ydim)
          head_arr_sc2      = STRARR(nscfiles,hdim)
          jd_arr2           = DBLARR(nscfiles)
          date_obs2         = STRARR(nscfiles)
          rad_temp2         = DBLARR(nscfiles)
          ccd_temp2         = DBLARR(nscfiles)
        ENDIF
        IF visit[i] EQ '3' THEN BEGIN
          sc_img_arr3       = FLTARR(nscfiles,xdim,ydim)
          head_arr_sc3      = STRARR(nscfiles,hdim)
          jd_arr3           = DBLARR(nscfiles)
          date_obs3         = STRARR(nscfiles)
          rad_temp3         = DBLARR(nscfiles)
          ccd_temp3         = DBLARR(nscfiles)
        ENDIF
        IF visit[i] EQ '4' THEN BEGIN
          sc_img_arr4       = FLTARR(nscfiles,xdim,ydim)
          head_arr_sc4      = STRARR(nscfiles,hdim)
          jd_arr4           = DBLARR(nscfiles)
          date_obs4         = STRARR(nscfiles)
          rad_temp4         = DBLARR(nscfiles)
          ccd_temp4         = DBLARR(nscfiles)
        ENDIF
        IF visit[i] EQ '5' THEN BEGIN
          sc_img_arr5       = FLTARR(nscfiles,xdim,ydim)
          head_arr_sc5      = STRARR(nscfiles,hdim)
          jd_arr5           = DBLARR(nscfiles)
          date_obs5         = STRARR(nscfiles)
          rad_temp5         = DBLARR(nscfiles)
          ccd_temp5         = DBLARR(nscfiles)
        ENDIF
        IF visit[i] EQ '6' THEN BEGIN
          sc_img_arr6       = FLTARR(nscfiles,xdim,ydim)
          head_arr_sc6      = STRARR(nscfiles,hdim)
          jd_arr6           = DBLARR(nscfiles)
          date_obs6         = STRARR(nscfiles)
          rad_temp6         = DBLARR(nscfiles)
          ccd_temp6         = DBLARR(nscfiles)
        ENDIF
        IF visit[i] EQ '7' THEN BEGIN
          sc_img_arr7       = FLTARR(nscfiles,xdim,ydim)
          head_arr_sc7      = STRARR(nscfiles,hdim)
          jd_arr7           = DBLARR(nscfiles)
          date_obs7         = STRARR(nscfiles)
          rad_temp7         = DBLARR(nscfiles)
          ccd_temp7         = DBLARR(nscfiles)
        ENDIF
        IF visit[i] EQ '8' THEN BEGIN
          sc_img_arr8       = FLTARR(nscfiles,xdim,ydim)
          head_arr_sc8      = STRARR(nscfiles,hdim)
          jd_arr8           = DBLARR(nscfiles)
          date_obs8         = STRARR(nscfiles)
          rad_temp8         = DBLARR(nscfiles)
          ccd_temp8         = DBLARR(nscfiles)
        ENDIF
        IF visit[i] EQ '9' THEN BEGIN
          sc_img_arr9       = FLTARR(nscfiles,xdim,ydim)
          head_arr_sc9      = STRARR(nscfiles,hdim)
          jd_arr9           = DBLARR(nscfiles)
          date_obs9         = STRARR(nscfiles)
          rad_temp9         = DBLARR(nscfiles)
          ccd_temp9         = DBLARR(nscfiles)
        ENDIF
        IF visit[i] EQ '10' THEN BEGIN
          sc_img_arr10       = FLTARR(nscfiles,xdim,ydim)
          head_arr_sc10      = STRARR(nscfiles,hdim)
          jd_arr10           = DBLARR(nscfiles)
          date_obs10         = STRARR(nscfiles)
          rad_temp10         = DBLARR(nscfiles)
          ccd_temp10         = DBLARR(nscfiles)
        ENDIF
      ENDIF
      IF visit[i] EQ '1' THEN BEGIN
        sc_img_arr1[j,*,*]   = result
        head_arr_sc1[j,*]    = header
        jd_arr1[j]           = SXPAR(header,'JD')
        date_obs1[j]         = SXPAR(header,'DATE-OBS')
        rad_temp1[j]         = SXPAR(header,'RAD_TEMP')
        ccd_temp1[j]         = SXPAR(header,'CCD_TEMP')
      ENDIF
      IF visit[i] EQ '2' THEN BEGIN
        sc_img_arr2[j,*,*]   = result
        head_arr_sc2[j,*]    = header
        jd_arr2[j]           = SXPAR(header,'JD')
        date_obs2[j]         = SXPAR(header,'DATE-OBS')
        rad_temp2[j]         = SXPAR(header,'RAD_TEMP')
        ccd_temp2[j]         = SXPAR(header,'CCD_TEMP')
      ENDIF
      IF visit[i] EQ '3' THEN BEGIN
        sc_img_arr3[j,*,*]   = result
        head_arr_sc3[j,*]    = header
        jd_arr3[j]           = SXPAR(header,'JD')
        date_obs3[j]         = SXPAR(header,'DATE-OBS')
        rad_temp3[j]         = SXPAR(header,'RAD_TEMP')
        ccd_temp3[j]         = SXPAR(header,'CCD_TEMP')
      ENDIF
      IF visit[i] EQ '4' THEN BEGIN
        sc_img_arr4[j,*,*]   = result
        head_arr_sc4[j,*]    = header
        jd_arr4[j]           = SXPAR(header,'JD')
        date_obs4[j]         = SXPAR(header,'DATE-OBS')
        rad_temp4[j]         = SXPAR(header,'RAD_TEMP')
        ccd_temp4[j]         = SXPAR(header,'CCD_TEMP')
      ENDIF
      IF visit[i] EQ '5' THEN BEGIN
        sc_img_arr5[j,*,*]   = result
        head_arr_sc5[j,*]    = header
        jd_arr5[j]           = SXPAR(header,'JD')
        date_obs5[j]         = SXPAR(header,'DATE-OBS')
        rad_temp5[j]         = SXPAR(header,'RAD_TEMP')
        ccd_temp5[j]         = SXPAR(header,'CCD_TEMP')
      ENDIF
      IF visit[i] EQ '6' THEN BEGIN
        sc_img_arr6[j,*,*]   = result
        head_arr_sc6[j,*]    = header
        jd_arr6[j]           = SXPAR(header,'JD')
        date_obs6[j]         = SXPAR(header,'DATE-OBS')
        rad_temp6[j]         = SXPAR(header,'RAD_TEMP')
        ccd_temp6[j]         = SXPAR(header,'CCD_TEMP')
      ENDIF
      IF visit[i] EQ '7' THEN BEGIN
        sc_img_arr7[j,*,*]   = result
        head_arr_sc7[j,*]    = header
        jd_arr7[j]           = SXPAR(header,'JD')
        date_obs7[j]         = SXPAR(header,'DATE-OBS')
        rad_temp7[j]         = SXPAR(header,'RAD_TEMP')
        ccd_temp7[j]         = SXPAR(header,'CCD_TEMP')
      ENDIF
      IF visit[i] EQ '8' THEN BEGIN
        sc_img_arr8[j,*,*]   = result
        head_arr_sc8[j,*]    = header
        jd_arr8[j]           = SXPAR(header,'JD')
        date_obs8[j]         = SXPAR(header,'DATE-OBS')
        rad_temp8[j]         = SXPAR(header,'RAD_TEMP')
        ccd_temp8[j]         = SXPAR(header,'CCD_TEMP')
      ENDIF
      IF visit[i] EQ '9' THEN BEGIN
        sc_img_arr9[j,*,*]   = result
        head_arr_sc9[j,*]    = header
        jd_arr9[j]           = SXPAR(header,'JD')
        date_obs9[j]         = SXPAR(header,'DATE-OBS')
        rad_temp9[j]         = SXPAR(header,'RAD_TEMP')
        ccd_temp9[j]         = SXPAR(header,'CCD_TEMP')
      ENDIF
      IF visit[i] EQ '10' THEN BEGIN
        sc_img_arr10[j,*,*]   = result
        head_arr_sc10[j,*]    = header
        jd_arr10[j]           = SXPAR(header,'JD')
        date_obs10[j]         = SXPAR(header,'DATE-OBS')
        rad_temp10[j]         = SXPAR(header,'RAD_TEMP')
        ccd_temp10[j]         = SXPAR(header,'CCD_TEMP')
      ENDIF
    ENDFOR
  ENDFOR
ENDELSE

;Take the same amount of non-spectral portion as the spectral portion and subtract the mean of each column against each other
;The dark corrected 1D stellar spectra
star_spec1  = DBLARR(nfiles1,2048)
star_spec2  = DBLARR(nfiles2,2048)
star_spec3  = DBLARR(nfiles3,2048)
star_spec4  = DBLARR(nfiles4,2048)
star_spec5  = DBLARR(nfiles5,2048)
star_spec6  = DBLARR(nfiles6,2048)
star_spec7  = DBLARR(nfiles7,2048)
star_spec8  = DBLARR(nfiles8,2048)
star_spec9  = DBLARR(nfiles9,2048)
star_spec10 = DBLARR(nfiles10,2048)
star_spec1_nocorr  = DBLARR(nfiles1,2048)
star_spec2_nocorr  = DBLARR(nfiles2,2048)
star_spec3_nocorr  = DBLARR(nfiles3,2048)
star_spec4_nocorr  = DBLARR(nfiles4,2048)
star_spec5_nocorr  = DBLARR(nfiles5,2048)
star_spec6_nocorr  = DBLARR(nfiles6,2048)
star_spec7_nocorr  = DBLARR(nfiles7,2048)
star_spec8_nocorr  = DBLARR(nfiles8,2048)
star_spec9_nocorr  = DBLARR(nfiles9,2048)
star_spec10_nocorr = DBLARR(nfiles10,2048)
star_spec1_noise   = DBLARR(nfiles1,2048)
star_spec2_noise   = DBLARR(nfiles2,2048)
star_spec3_noise   = DBLARR(nfiles3,2048)
star_spec4_noise   = DBLARR(nfiles4,2048)
star_spec5_noise   = DBLARR(nfiles5,2048)
star_spec6_noise   = DBLARR(nfiles6,2048)
star_spec7_noise   = DBLARR(nfiles7,2048)
star_spec8_noise   = DBLARR(nfiles8,2048)
star_spec9_noise   = DBLARR(nfiles9,2048)
star_spec10_noise  = DBLARR(nfiles10,2048)
;The dark array 1D counts
dark_spec1  = DBLARR(nfiles1,2048)
dark_spec2  = DBLARR(nfiles2,2048)
dark_spec3  = DBLARR(nfiles3,2048)
dark_spec4  = DBLARR(nfiles4,2048)
dark_spec5  = DBLARR(nfiles5,2048)
dark_spec6  = DBLARR(nfiles6,2048)
dark_spec7  = DBLARR(nfiles7,2048)
dark_spec8  = DBLARR(nfiles8,2048)
dark_spec9  = DBLARR(nfiles9,2048)
dark_spec10 = DBLARR(nfiles10,2048)

FOR i=0, nvis-1 DO BEGIN
  ;Connect a line from left to right to figure out which pixels contain the stellar spectra
  IF visit[i] EQ '1' THEN BEGIN
    y1_sc = 38.-1
    y2_sc = 69.-1
    x1_sc = 52.-1
    x2_sc = 2099.-1
    m1_sc = (y2_sc-y1_sc)/(x2_sc-x1_sc)
    inct1_sc = y1_sc - m1_sc*x1_sc

    y3_sc = 60.-1
    y4_sc = 89.-1
    x3_sc = 52.-1
    x4_sc = 2099.-1
    m2_sc = (y4_sc-y3_sc)/(x4_sc-x3_sc)
    inct2_sc = y3_sc - m2_sc*x3_sc

    y1_dk = 5.-1
    y2_dk = 36.-1
    x1_dk = 52.-1
    x2_dk = 2099.-1
    m1_dk = (y2_dk-y1_dk)/(x2_dk-x1_dk)
    inct1_dk = y1_dk - m1_dk*x1_dk

    y3_dk = 27.-1
    y4_dk = 56.-1
    x3_dk = 52.-1
    x4_dk = 2099.-1
    m2_dk = (y4_dk-y3_dk)/(x4_dk-x3_dk)
    inct2_dk = y3_dk - m2_dk*x3_dk
    nfiles = nfiles1
    science_img = sc_img_arr1
  ENDIF
  IF visit[i] EQ '2' THEN BEGIN
    y1_sc = 39.-1
    y2_sc = 71.-1
    x1_sc = 52.-1
    x2_sc = 2099.-1
    m1_sc = (y2_sc-y1_sc)/(x2_sc-x1_sc)
    inct1_sc = y1_sc - m1_sc*x1_sc

    y3_sc = 61.-1
    y4_sc = 91.-1
    x3_sc = 52.-1
    x4_sc = 2099.-1
    m2_sc = (y4_sc-y3_sc)/(x4_sc-x3_sc)
    inct2_sc = y3_sc - m2_sc*x3_sc

    y1_dk = 6.-1
    y2_dk = 38.-1
    x1_dk = 52.-1
    x2_dk = 2099.-1
    m1_dk = (y2_dk-y1_dk)/(x2_dk-x1_dk)
    inct1_dk = y1_dk - m1_dk*x1_dk

    y3_dk = 28.-1
    y4_dk = 58.-1
    x3_dk = 52.-1
    x4_dk = 2099.-1
    m2_dk = (y4_dk-y3_dk)/(x4_dk-x3_dk)
    inct2_dk = y3_dk - m2_dk*x3_dk
    nfiles = nfiles2
    science_img = sc_img_arr2
  ENDIF
  IF visit[i] EQ '3' THEN BEGIN
    y1_sc = 39.-1
    y2_sc = 71.-1
    x1_sc = 52.-1
    x2_sc = 2099.-1
    m1_sc = (y2_sc-y1_sc)/(x2_sc-x1_sc)
    inct1_sc = y1_sc - m1_sc*x1_sc

    y3_sc = 61.-1
    y4_sc = 90.-1
    x3_sc = 52.-1
    x4_sc = 2099.-1
    m2_sc = (y4_sc-y3_sc)/(x4_sc-x3_sc)
    inct2_sc = y3_sc - m2_sc*x3_sc

    y1_dk = 6.-1
    y2_dk = 38.-1
    x1_dk = 52.-1
    x2_dk = 2099.-1
    m1_dk = (y2_dk-y1_dk)/(x2_dk-x1_dk)
    inct1_dk = y1_dk - m1_dk*x1_dk

    y3_dk = 28.-1
    y4_dk = 57.-1
    x3_dk = 52.-1
    x4_dk = 2099.-1
    m2_dk = (y4_dk-y3_dk)/(x4_dk-x3_dk)
    inct2_dk = y3_dk - m2_dk*x3_dk
    nfiles = nfiles3
    science_img = sc_img_arr3
  ENDIF
  IF visit[i] EQ '4' THEN BEGIN
    y1_sc = 42.-1
    y2_sc = 73.-1
    x1_sc = 52.-1
    x2_sc = 2099.-1
    m1_sc = (y2_sc-y1_sc)/(x2_sc-x1_sc)
    inct1_sc = y1_sc - m1_sc*x1_sc

    y3_sc = 64.-1
    y4_sc = 93.-1
    x3_sc = 52.-1
    x4_sc = 2099.-1
    m2_sc = (y4_sc-y3_sc)/(x4_sc-x3_sc)
    inct2_sc = y3_sc - m2_sc*x3_sc

    y1_dk = 9.-1
    y2_dk = 40.-1
    x1_dk = 52.-1
    x2_dk = 2099.-1
    m1_dk = (y2_dk-y1_dk)/(x2_dk-x1_dk)
    inct1_dk = y1_dk - m1_dk*x1_dk

    y3_dk = 31.-1
    y4_dk = 60.-1
    x3_dk = 52.-1
    x4_dk = 2099.-1
    m2_dk = (y4_dk-y3_dk)/(x4_dk-x3_dk)
    inct2_dk = y3_dk - m2_dk*x3_dk
    nfiles = nfiles4
    science_img = sc_img_arr4
  ENDIF
  IF visit[i] EQ '5' THEN BEGIN
    y1_sc = 39.-1
    y2_sc = 73.-1
    x1_sc = 52.-1
    x2_sc = 2099.-1
    m1_sc = (y2_sc-y1_sc)/(x2_sc-x1_sc)
    inct1_sc = y1_sc - m1_sc*x1_sc

    y3_sc = 61.-1
    y4_sc = 93.-1
    x3_sc = 52.-1
    x4_sc = 2099.-1
    m2_sc = (y4_sc-y3_sc)/(x4_sc-x3_sc)
    inct2_sc = y3_sc - m2_sc*x3_sc

    y1_dk = 6.-1
    y2_dk = 40.-1
    x1_dk = 52.-1
    x2_dk = 2099.-1
    m1_dk = (y2_dk-y1_dk)/(x2_dk-x1_dk)
    inct1_dk = y1_dk - m1_dk*x1_dk

    y3_dk = 28.-1
    y4_dk = 60.-1
    x3_dk = 52.-1
    x4_dk = 2099.-1
    m2_dk = (y4_dk-y3_dk)/(x4_dk-x3_dk)
    inct2_dk = y3_dk - m2_dk*x3_dk
    nfiles = nfiles5
    science_img = sc_img_arr5
  ENDIF
  IF visit[i] EQ '6' THEN BEGIN
    y1_sc = 37.-1
    y2_sc = 70.-1
    x1_sc = 52.-1
    x2_sc = 2099.-1
    m1_sc = (y2_sc-y1_sc)/(x2_sc-x1_sc)
    inct1_sc = y1_sc - m1_sc*x1_sc

    y3_sc = 61.-1
    y4_sc = 90.-1
    x3_sc = 52.-1
    x4_sc = 2099.-1
    m2_sc = (y4_sc-y3_sc)/(x4_sc-x3_sc)
    inct2_sc = y3_sc - m2_sc*x3_sc

    y1_dk = 4.-1
    y2_dk = 37.-1
    x1_dk = 52.-1
    x2_dk = 2099.-1
    m1_dk = (y2_dk-y1_dk)/(x2_dk-x1_dk)
    inct1_dk = y1_dk - m1_dk*x1_dk

    y3_dk = 28.-1
    y4_dk = 57.-1
    x3_dk = 52.-1
    x4_dk = 2099.-1
    m2_dk = (y4_dk-y3_dk)/(x4_dk-x3_dk)
    inct2_dk = y3_dk - m2_dk*x3_dk
    nfiles = nfiles6
    science_img = sc_img_arr6
;----------for frame IDs 5551, 5552----------    
    y1_sc2 = 45.-1
    y2_sc2 = 78.-1
    x1_sc2 = 52.-1
    x2_sc2 = 2099.-1
    m1_sc2 = (y2_sc2-y1_sc2)/(x2_sc2-x1_sc2)
    inct1_sc2 = y1_sc2 - m1_sc2*x1_sc2

    y3_sc2 = 70.-1
    y4_sc2 = 97.-1
    x3_sc2 = 52.-1
    x4_sc2 = 2099.-1
    m2_sc2 = (y4_sc2-y3_sc2)/(x4_sc2-x3_sc2)
    inct2_sc2 = y3_sc2 - m2_sc2*x3_sc2

    y1_dk2 = 12.-1
    y2_dk2 = 45.-1
    x1_dk2 = 52.-1
    x2_dk2 = 2099.-1
    m1_dk2 = (y2_dk2-y1_dk2)/(x2_dk2-x1_dk2)
    inct1_dk2 = y1_dk2 - m1_dk2*x1_dk2

    y3_dk2 = 37.-1
    y4_dk2 = 64.-1
    x3_dk2 = 52.-1
    x4_dk2 = 2099.-1
    m2_dk2 = (y4_dk2-y3_dk2)/(x4_dk2-x3_dk2)
    inct2_dk2 = y3_dk2 - m2_dk2*x3_dk2
    nfiles = nfiles6
    science_img = sc_img_arr6
  ENDIF
  IF visit[i] EQ '7' THEN BEGIN
    y1_sc = 37.-1
    y2_sc = 68.-1
    x1_sc = 52.-1
    x2_sc = 2099.-1
    m1_sc = (y2_sc-y1_sc)/(x2_sc-x1_sc)
    inct1_sc = y1_sc - m1_sc*x1_sc

    y3_sc = 59.-1
    y4_sc = 87.-1
    x3_sc = 52.-1
    x4_sc = 2099.-1
    m2_sc = (y4_sc-y3_sc)/(x4_sc-x3_sc)
    inct2_sc = y3_sc - m2_sc*x3_sc

    y1_dk = 4.-1
    y2_dk = 35.-1
    x1_dk = 52.-1
    x2_dk = 2099.-1
    m1_dk = (y2_dk-y1_dk)/(x2_dk-x1_dk)
    inct1_dk = y1_dk - m1_dk*x1_dk

    y3_dk = 26.-1
    y4_dk = 54.-1
    x3_dk = 52.-1
    x4_dk = 2099.-1
    m2_dk = (y4_dk-y3_dk)/(x4_dk-x3_dk)
    inct2_dk = y3_dk - m2_dk*x3_dk
    nfiles = nfiles7
    science_img = sc_img_arr7
  ENDIF
  IF visit[i] EQ '8' THEN BEGIN
    y1_sc = 35.-1
    y2_sc = 67.-1
    x1_sc = 52.-1
    x2_sc = 2099.-1
    m1_sc = (y2_sc-y1_sc)/(x2_sc-x1_sc)
    inct1_sc = y1_sc - m1_sc*x1_sc

    y3_sc = 59.-1
    y4_sc = 86.-1
    x3_sc = 52.-1
    x4_sc = 2099.-1
    m2_sc = (y4_sc-y3_sc)/(x4_sc-x3_sc)
    inct2_sc = y3_sc - m2_sc*x3_sc

    y1_dk = 2.-1
    y2_dk = 34.-1
    x1_dk = 52.-1
    x2_dk = 2099.-1
    m1_dk = (y2_dk-y1_dk)/(x2_dk-x1_dk)
    inct1_dk = y1_dk - m1_dk*x1_dk

    y3_dk = 26.-1
    y4_dk = 53.-1
    x3_dk = 52.-1
    x4_dk = 2099.-1
    m2_dk = (y4_dk-y3_dk)/(x4_dk-x3_dk)
    inct2_dk = y3_dk - m2_dk*x3_dk
    nfiles = nfiles8
    science_img = sc_img_arr8
  ENDIF
  IF visit[i] EQ '9' THEN BEGIN
    y1_sc = 43.-1
    y2_sc = 79.-1
    x1_sc = 52.-1
    x2_sc = 2099.-1
    m1_sc = (y2_sc-y1_sc)/(x2_sc-x1_sc)
    inct1_sc = y1_sc - m1_sc*x1_sc

    y3_sc = 69.-1
    y4_sc = 98.-1
    x3_sc = 52.-1
    x4_sc = 2099.-1
    m2_sc = (y4_sc-y3_sc)/(x4_sc-x3_sc)
    inct2_sc = y3_sc - m2_sc*x3_sc

    y1_dk = 10.-1
    y2_dk = 46.-1
    x1_dk = 52.-1
    x2_dk = 2099.-1
    m1_dk = (y2_dk-y1_dk)/(x2_dk-x1_dk)
    inct1_dk = y1_dk - m1_dk*x1_dk

    y3_dk = 36.-1
    y4_dk = 65.-1
    x3_dk = 52.-1
    x4_dk = 2099.-1
    m2_dk = (y4_dk-y3_dk)/(x4_dk-x3_dk)
    inct2_dk = y3_dk - m2_dk*x3_dk
    nfiles = nfiles9
    science_img = sc_img_arr9
  ENDIF
  IF visit[i] EQ '10' THEN BEGIN
    y1_sc = 35.-1
    y2_sc = 66.-1
    x1_sc = 52.-1
    x2_sc = 2099.-1
    m1_sc = (y2_sc-y1_sc)/(x2_sc-x1_sc)
    inct1_sc = y1_sc - m1_sc*x1_sc

    y3_sc = 59.-1
    y4_sc = 85.-1
    x3_sc = 52.-1
    x4_sc = 2099.-1
    m2_sc = (y4_sc-y3_sc)/(x4_sc-x3_sc)
    inct2_sc = y3_sc - m2_sc*x3_sc

    y1_dk = 2.-1
    y2_dk = 33.-1
    x1_dk = 52.-1
    x2_dk = 2099.-1
    m1_dk = (y2_dk-y1_dk)/(x2_dk-x1_dk)
    inct1_dk = y1_dk - m1_dk*x1_dk

    y3_dk = 26.-1
    y4_dk = 52.-1
    x3_dk = 52.-1
    x4_dk = 2099.-1
    m2_dk = (y4_dk-y3_dk)/(x4_dk-x3_dk)
    inct2_dk = y3_dk - m2_dk*x3_dk
    nfiles = nfiles10
    science_img = sc_img_arr10
  ENDIF
  FOR j=0, nfiles-1 DO BEGIN
    count   = 0
    spectra = DBLARR(2048)
    noise   = DBLARR(2048)
    spec_nocorr = DBLARR(2048)
    dark    = DBLARR(2048)
    IF (visit[i] EQ '6') AND ((j EQ 8) OR (j EQ 9)) THEN BEGIN
      FOR k= 52, 2099 DO BEGIN
        yval1_dk           = m1_dk2*k + inct1_dk2
        yval2_dk           = m2_dk2*k + inct2_dk2
        dark_val           = MEDIAN(science_img[j,k,yval1_dk:yval2_dk])
        dark[count]        = dark_val
        yval1_sc           = m1_sc2*k + inct1_sc2
        yval2_sc           = m2_sc2*k + inct2_sc2
        spectra[count]     = TOTAL(science_img[j,k,yval1_sc:yval2_sc]-dark_val)
        uncert_scpix       = SQRT(science_img[j,k,yval1_sc:yval2_sc])
        uncert_dark        = SQRT(dark_val)
        nn                 = SQRT(uncert_scpix*uncert_scpix + uncert_dark*uncert_dark)
        spec_nocorr[count] = TOTAL(science_img[j,k,yval1_sc:yval2_sc])
        noise[count]       = SQRT(TOTAL(nn*nn))
        count              = count + 1
      ENDFOR
    ENDIF ELSE BEGIN
      FOR k= 52, 2099 DO BEGIN
        yval1_dk           = m1_dk*k + inct1_dk
        yval2_dk           = m2_dk*k + inct2_dk
        dark_val           = MEDIAN(science_img[j,k,yval1_dk:yval2_dk])
        dark[count]        = dark_val
        yval1_sc           = m1_sc*k + inct1_sc
        yval2_sc           = m2_sc*k + inct2_sc
        spectra[count]     = TOTAL(science_img[j,k,yval1_sc:yval2_sc]-dark_val)
        uncert_scpix       = SQRT(science_img[j,k,yval1_sc:yval2_sc])
        uncert_dark        = SQRT(dark_val)
        nn                 = SQRT(uncert_scpix*uncert_scpix + uncert_dark*uncert_dark)
        spec_nocorr[count] = TOTAL(science_img[j,k,yval1_sc:yval2_sc])
        noise[count]       = SQRT(TOTAL(nn*nn))
        count              = count + 1
      ENDFOR
    ENDELSE
    spectra = REVERSE(spectra)
    spec_nocorr = REVERSE(spec_nocorr)
    IF visit[i] EQ '1' THEN BEGIN
      star_spec1[j,*]        = spectra
      star_spec1_noise[j,*]  = noise
      star_spec1_nocorr[j,*] = spec_nocorr
      dark_spec1[j,*]        = dark
    ENDIF
    IF visit[i] EQ '2' THEN BEGIN
      star_spec2[j,*]        = spectra
      star_spec2_noise[j,*]  = noise
      star_spec2_nocorr[j,*] = spec_nocorr
      dark_spec2[j,*]        = dark
    ENDIF
    IF visit[i] EQ '3' THEN BEGIN
      star_spec3[j,*]        = spectra
      star_spec3_noise[j,*]  = noise
      star_spec3_nocorr[j,*] = spec_nocorr
      dark_spec3[j,*]        = dark
    ENDIF
    IF visit[i] EQ '4' THEN BEGIN
      star_spec4[j,*]        = spectra
      star_spec4_noise[j,*]  = noise
      star_spec4_nocorr[j,*] = spec_nocorr
      dark_spec4[j,*]        = dark
    ENDIF
    IF visit[i] EQ '5' THEN BEGIN
      star_spec5[j,*]        = spectra
      star_spec5_noise[j,*]  = noise
      star_spec5_nocorr[j,*] = spec_nocorr
      dark_spec5[j,*]        = dark
    ENDIF
    IF visit[i] EQ '6' THEN BEGIN
      star_spec6[j,*]        = spectra
      star_spec6_noise[j,*]  = noise
      star_spec6_nocorr[j,*] = spec_nocorr
      dark_spec6[j,*]        = dark
    ENDIF
    IF visit[i] EQ '7' THEN BEGIN
      star_spec7[j,*]        = spectra
      star_spec7_noise[j,*]  = noise
      star_spec7_nocorr[j,*] = spec_nocorr
      dark_spec7[j,*]        = dark
    ENDIF
    IF visit[i] EQ '8' THEN BEGIN
      star_spec8[j,*]        = spectra
      star_spec8_noise[j,*]  = noise
      star_spec8_nocorr[j,*] = spec_nocorr
      dark_spec8[j,*]        = dark
    ENDIF
    IF visit[i] EQ '9' THEN BEGIN
      star_spec9[j,*]        = spectra
      star_spec9_noise[j,*]  = noise
      star_spec9_nocorr[j,*] = spec_nocorr
      dark_spec9[j,*]        = dark
    ENDIF
    IF visit[i] EQ '10' THEN BEGIN
      star_spec10[j,*]        = spectra
      star_spec10_noise[j,*]  = noise
      star_spec10_nocorr[j,*] = spec_nocorr
      dark_spec10[j,*]        = dark
    ENDIF
  ENDFOR
ENDFOR

READCOL,'/Users/dobh6980/Projects/Kevin_projects/CUTE/pro/Arika_programs/flight_quad_wavelength_solution_final.dat',$
  wave_sol,FORMAT='A',COMMENT='#'
wave_sol = FLOAT(wave_sol)

;Read in Arika's file
READCOL,'/Users/dobh6980/Projects/Kevin_projects/CUTE/pro/Arika_programs/cute_recalculated_effa_2025.txt',$
  eff_area,wave_val,FORMAT='A,A',COMMENT='#'
eff_area     = FLOAT(eff_area)
wave_val     = FLOAT(wave_val)
eff_area_mod = INTERPOL(eff_area,wave_val,wave_sol)*1.58

;Now convert the spectra from counts to ergs/cm^2/sec/Ang
h = 6.626075540e-27 ; ergs * s
c = 2.99792458e+10  ;cm/s

e_per_sec_star1 = star_spec1*0
e_per_sec_star2 = star_spec2*0
e_per_sec_star3 = star_spec3*0
e_per_sec_star4 = star_spec4*0
e_per_sec_star5 = star_spec5*0
e_per_sec_star6 = star_spec6*0
e_per_sec_star7 = star_spec7*0
e_per_sec_star8 = star_spec8*0
e_per_sec_star9 = star_spec9*0
e_per_sec_star10 = star_spec10*0

flux_units_star1 = star_spec1*0
flux_units_star2 = star_spec2*0
flux_units_star3 = star_spec3*0
flux_units_star4 = star_spec4*0
flux_units_star5 = star_spec5*0
flux_units_star6 = star_spec6*0
flux_units_star7 = star_spec7*0
flux_units_star8 = star_spec8*0
flux_units_star9 = star_spec9*0
flux_units_star10 = star_spec10*0

FOR i=0, nfiles1-1 DO BEGIN
  e_per_sec_star1[i,*]          = star_spec1[i,*]*(1.5/(240)) ;Here 1.5 is the detector gain and 240 is the exposure time of each science image
  flux_units_star1[i,*]         = e_per_sec_star1[i,*]*((h*c)/((wave_sol*1.E-8)*eff_area_mod)) ;ergs/cm^2/sec/Ang
  flux_units_star1[i,*]         = flux_units_star1[i,*]*0.48    ;The 0.48 factor accounts for the degradation of the detector with time
  wave_solmod                   = wave_sol-8                    ;This correction lines up the MgII feature in CUTE's spectra with any reference spectra of Alpha Cen (HST or IUE)
  ind1                          = WHERE(wave_solmod GE 2550 AND wave_solmod LE 3255)  ;Restricting the wavelength range from 2550 - 3255 Ang
  wave1mod                      = wave_solmod[ind1]
  flux1mod                      = REFORM(flux_units_star1[i,ind1])
ENDFOR
FOR i=0, nfiles2-1 DO BEGIN
  e_per_sec_star2[i,*]          = star_spec2[i,*]*(1.5/(240)) ;Here 1.5 is the detector gain and 240 is the exposure time of each science image
  flux_units_star2[i,*]         = e_per_sec_star2[i,*]*((h*c)/((wave_sol*1.E-8)*eff_area_mod)) ;ergs/cm^2/sec/Ang
  flux_units_star2[i,*]         = flux_units_star2[i,*]*0.48    ;The 0.56 factor accounts for the degradation of the detector with time
  wave_solmod                   = wave_sol-9                    ;This correction lines up the MgII feature in CUTE's spectra with any reference spectra of Alpha Cen (HST or IUE)
  ind2                          = WHERE(wave_solmod GE 2550 AND wave_solmod LE 3255)  ;Restricting the wavelength range from 2550 - 3255 Ang
  wave2mod                      = wave_solmod[ind2]
  flux2mod                      = REFORM(flux_units_star2[i,ind2])
ENDFOR
FOR i=0, nfiles3-1 DO BEGIN
  e_per_sec_star3[i,*]          = star_spec3[i,*]*(1.5/(240)) ;Here 1.5 is the detector gain and 240 is the exposure time of each science image
  flux_units_star3[i,*]         = e_per_sec_star3[i,*]*((h*c)/((wave_sol*1.E-8)*eff_area_mod)) ;ergs/cm^2/sec/Ang
  flux_units_star3[i,*]         = flux_units_star3[i,*]*0.48    ;The 0.56 factor accounts for the degradation of the detector with time
  wave_solmod                   = wave_sol-9                    ;This correction lines up the MgII feature in CUTE's spectra with any reference spectra of Alpha Cen (HST or IUE)
  ind3                          = WHERE(wave_solmod GE 2550 AND wave_solmod LE 3255)  ;Restricting the wavelength range from 2550 - 3255 Ang
  wave3mod                      = wave_solmod[ind3]
  flux3mod                      = REFORM(flux_units_star3[i,ind3])
ENDFOR
FOR i=0, nfiles4-1 DO BEGIN
  e_per_sec_star4[i,*]          = star_spec4[i,*]*(1.5/(240)) ;Here 1.5 is the detector gain and 240 is the exposure time of each science image
  flux_units_star4[i,*]         = e_per_sec_star4[i,*]*((h*c)/((wave_sol*1.E-8)*eff_area_mod)) ;ergs/cm^2/sec/Ang
  flux_units_star4[i,*]         = flux_units_star4[i,*]*0.48    ;The 0.56 factor accounts for the degradation of the detector with time
  wave_solmod                   = wave_sol-12                    ;This correction lines up the MgII feature in CUTE's spectra with any reference spectra of Alpha Cen (HST or IUE)
  ind4                          = WHERE(wave_solmod GE 2550 AND wave_solmod LE 3255)  ;Restricting the wavelength range from 2550 - 3255 Ang
  wave4mod                      = wave_solmod[ind4]
  flux4mod                      = REFORM(flux_units_star4[i,ind4])
ENDFOR
FOR i=0, nfiles5-1 DO BEGIN
  e_per_sec_star5[i,*]          = star_spec5[i,*]*(1.5/(240)) ;Here 1.5 is the detector gain and 240 is the exposure time of each science image
  flux_units_star5[i,*]         = e_per_sec_star5[i,*]*((h*c)/((wave_sol*1.E-8)*eff_area_mod)) ;ergs/cm^2/sec/Ang
  flux_units_star5[i,*]         = flux_units_star5[i,*]*0.48
  wave_solmod                   = wave_sol-2
  ind4                          = WHERE(wave_solmod GE 2550 AND wave_solmod LE 3255)
  wave4mod                      = wave_solmod[ind4]
  flux4mod                      = REFORM(flux_units_star5[i,ind4])
ENDFOR
FOR i=0, nfiles6-1 DO BEGIN
  e_per_sec_star6[i,*]          = star_spec6[i,*]*(1.5/(240)) ;Here 1.5 is the detector gain and 240 is the exposure time of each science image
  flux_units_star6[i,*]         = e_per_sec_star6[i,*]*((h*c)/((wave_sol*1.E-8)*eff_area_mod)) ;ergs/cm^2/sec/Ang
  flux_units_star6[i,*]         = flux_units_star6[i,*]*0.48
  wave_solmod                   = wave_sol-2
  ind4                          = WHERE(wave_solmod GE 2550 AND wave_solmod LE 3255)
  wave4mod                      = wave_solmod[ind4]
  flux4mod                      = REFORM(flux_units_star6[i,ind4])
ENDFOR
FOR i=0, nfiles7-1 DO BEGIN
  e_per_sec_star7[i,*]        = star_spec7[i,*]*(1.5/(240)) ;Here 1.5 is the detector gain and 240 is the exposure time of each science image
  flux_units_star7[i,*]       = e_per_sec_star7[i,*]*((h*c)/((wave_sol*1.E-8)*eff_area_mod)) ;ergs/cm^2/sec/Ang
  flux_units_star7[i,*]       = flux_units_star7[i,*]*0.48
  wave_solmod                 = wave_sol-2
  ind4                        = WHERE(wave_solmod GE 2550 AND wave_solmod LE 3255)
  wave4mod                    = wave_solmod[ind4]
  flux4mod                    = REFORM(flux_units_star7[i,ind4])
ENDFOR
FOR i=0, nfiles8-1 DO BEGIN
  e_per_sec_star8[i,*]        = star_spec8[i,*]*(1.5/(240)) ;Here 1.5 is the detector gain and 240 is the exposure time of each science image
  flux_units_star8[i,*]       = e_per_sec_star8[i,*]*((h*c)/((wave_sol*1.E-8)*eff_area_mod)) ;ergs/cm^2/sec/Ang
  flux_units_star8[i,*]       = flux_units_star8[i,*]*0.48
  wave_solmod                 = wave_sol-2
  ind4                        = WHERE(wave_solmod GE 2550 AND wave_solmod LE 3255)
  wave4mod                    = wave_solmod[ind4]
  flux4mod                    = REFORM(flux_units_star8[i,ind4])
ENDFOR
FOR i=0, nfiles9-1 DO BEGIN
  e_per_sec_star9[i,*]          = star_spec9[i,*]*(1.5/(240)) ;Here 1.5 is the detector gain and 240 is the exposure time of each science image
  flux_units_star9[i,*]         = e_per_sec_star9[i,*]*((h*c)/((wave_sol*1.E-8)*eff_area_mod)) ;ergs/cm^2/sec/Ang
  flux_units_star9[i,*]         = flux_units_star9[i,*]*0.48    ;The 0.56 factor accounts for the degradation of the detector with time
  wave_solmod                   = wave_sol-9                    ;This correction lines up the MgII feature in CUTE's spectra with any reference spectra of Alpha Cen (HST or IUE)
  ind9                          = WHERE(wave_solmod GE 2550 AND wave_solmod LE 3255)  ;Restricting the wavelength range from 2550 - 3255 Ang
  wave9mod                      = wave_solmod[ind9]
  flux9mod                      = REFORM(flux_units_star9[i,ind9])
ENDFOR
FOR i=0, nfiles10-1 DO BEGIN
  e_per_sec_star10[i,*]          = star_spec10[i,*]*(1.5/(240)) ;Here 1.5 is the detector gain and 240 is the exposure time of each science image
  flux_units_star10[i,*]         = e_per_sec_star10[i,*]*((h*c)/((wave_sol*1.E-8)*eff_area_mod)) ;ergs/cm^2/sec/Ang
  flux_units_star10[i,*]         = flux_units_star10[i,*]*0.48    ;The 0.56 factor accounts for the degradation of the detector with time
  wave_solmod                    = wave_sol-2                    ;This correction lines up the MgII feature in CUTE's spectra with any reference spectra of Alpha Cen (HST or IUE)
  ind10                          = WHERE(wave_solmod GE 2550 AND wave_solmod LE 3255)  ;Restricting the wavelength range from 2550 - 3255 Ang
  wave10mod                      = wave_solmod[ind10]
  flux10mod                      = REFORM(flux_units_star10[i,ind10])
ENDFOR

SAVE,wave_sol,flux_units_star1,flux_units_star2,flux_units_star3,flux_units_star4,flux_units_star5,flux_units_star6,flux_units_star7,flux_units_star8,flux_units_star9,flux_units_star10,$
     dark_spec1,dark_spec2,dark_spec3,dark_spec4,dark_spec5,dark_spec6,dark_spec7,dark_spec8,dark_spec9,dark_spec10,$
     date_obs1,date_obs2,date_obs3,date_obs4,date_obs5,date_obs6,date_obs7,date_obs8,date_obs9,date_obs10,$
     FILENAME='/Users/dobh6980/Projects/Kevin_projects/CUTE/Alpha_Cen/CUTE2025_visit12345678910_reduced_v1.sav'

STOP
END