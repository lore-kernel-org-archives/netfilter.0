From: E2IA <e2ia.ci@gmail.com>
Subject: Re: mark and accept in a single rule
Date: Sun, 20 Feb 2011 16:10:50 +0000
Message-ID: <AANLkTimO0tqE4ftCtBLv1n+X6hdJqQANEh7vicz_NL50@mail.gmail.com>
References: <AANLkTimFXztjt5iJbv2bnP3iqe9GoTcaqEbg1ULsWynZ@mail.gmail.com>
	<1298215673.12048.12.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=trSD41m4RPfly2bd83haF78r9ezSgGLCC6rjQaAXL/A=;
        b=nA1u25atrC/8Iwkx5jXI7ZoYwsy/cQ8erL1SCfMr2iymlKGWEyOjQspHyHA2Yp6lPc
         ozw1Ojp6se92QVcpim/fHi1TTub3DS1Xr/98KaKymT7nZhwBmPWAUGGVdnTzHfZaSwrc
         uTKJ9l+e74tU+azcn8j1r+RwjIsuNB2AyLZPw=
In-Reply-To: <1298215673.12048.12.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

Hi here is my complete rule set:
#!/bin/bash
#script Shapping marker config
/usr/local/sbin/iptables  -t mangle -F FORWARD
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  yahoo  -j MARK --set-mark 74
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  74
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  msn-filetransfer  -j MARK --set-mark 71
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  71
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  msnmessenger  -j MARK --set-mark 72
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  72
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  aim  -j MARK --set-mark 65
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  65
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  aimwebcontent  -j MARK --set-mark 66
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  66
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m helper --helper
 irc  -j MARK --set-mark 67
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  irc  -j MARK --set-mark 67
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  67
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  cimd  -j MARK --set-mark 69
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  69
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  gtalk  -j MARK --set-mark 124
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
124 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  chikka  -j MARK --set-mark 68
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  68
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  jabber  -j MARK --set-mark 70
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  70
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  qq  -j MARK --set-mark 73
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  73
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  validcertssl  -j MARK --set-mark 33
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  33
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  ssl  -j MARK --set-mark 26
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  26
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  http-rtsp  -j MARK --set-mark 75
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  75
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  quicktime  -j MARK --set-mark 84
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  84
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  http-itunes  -j MARK --set-mark 81
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  81
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  httpaudio  -j MARK --set-mark 82
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  82
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  httpvideo  -j MARK --set-mark 83
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  83
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  httpcachemiss  -j MARK --set-mark 39
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  39
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  httpcachehit  -j MARK --set-mark 38
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  38
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  shoutcast  -j MARK --set-mark 80
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  80
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  http-dap  -j MARK --set-mark 36
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  36
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  http-freshdownload  -j MARK --set-mark 37
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  37
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  http  -j MARK --set-mark 9
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  9 -=
j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m helper --helper
 ftp  -j MARK --set-mark 7
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  ftp  -j MARK --set-mark 7
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  7 -=
j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  gopher  -j MARK --set-mark 8
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  8 -=
j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  smtp  -j MARK --set-mark 21
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  21
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  pop3  -j MARK --set-mark 19
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  19
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  snmp-trap  -j MARK --set-mark 41
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  41
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  snmp-mon  -j MARK --set-mark 40
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  40
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  snmp  -j MARK --set-mark 22
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  22
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m helper --helper
 sip  -j MARK --set-mark 94
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  sip  -j MARK --set-mark 94
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  94
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m helper --helper
 h323  -j MARK --set-mark 93
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  h323  -j MARK --set-mark 93
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  93
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  teamspeak  -j MARK --set-mark 97
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  97
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  ventrilo  -j MARK --set-mark 98
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  98
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  rtsp  -j MARK --set-mark 79
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  79
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  live365  -j MARK --set-mark 76
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  76
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  pplive  -j MARK --set-mark 77
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  77
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  x11  -j MARK --set-mark 92
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  92
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  vnc  -j MARK --set-mark 91
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  91
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  pcanywhere  -j MARK --set-mark 87
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  87
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  rdp  -j MARK --set-mark 89
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  89
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  rlogin  -j MARK --set-mark 90
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  90
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  radmin  -j MARK --set-mark 88
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  88
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  ssh  -j MARK --set-mark 25
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  25
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  ciscovpn  -j MARK --set-mark 85
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  85
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  citrix  -j MARK --set-mark 86
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  86
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  subspace  -j MARK --set-mark 113
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
113 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  gkrellm  -j MARK --set-mark 118
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
118 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  tor  -j MARK --set-mark 122
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
122 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  tonghuashun  -j MARK --set-mark 121
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
121 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  replaytv-ivs  -j MARK --set-mark 120
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
120 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  hddtemp  -j MARK --set-mark 119
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
119 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  dazhihui  -j MARK --set-mark 117
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
117 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  xboxlive  -j MARK --set-mark 116
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
116 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  worldofwarcraft  -j MARK --set-mark 115
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
115 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  teamfortress2  -j MARK --set-mark 114
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
114 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  runesofmagic  -j MARK --set-mark 112
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
112 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  quake1  -j MARK --set-mark 111
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
111 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  battlefield1942  -j MARK --set-mark 100
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
100 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  battlefield2142  -j MARK --set-mark 102
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
102 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  counterstrike-source  -j MARK --set-mark 103
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
103 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  dayofdefeat-source  -j MARK --set-mark 104
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
104 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  doom3  -j MARK --set-mark 105
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
105 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  guildwars  -j MARK --set-mark 107
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
107 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  armagetron  -j MARK --set-mark 99
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  99
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  liveforspeed  -j MARK --set-mark 108
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
108 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  halflife2-deathmatch  -j MARK --set-mark 106
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
106 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  battlefield2  -j MARK --set-mark 101
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
101 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  netbios  -j MARK --set-mark 16
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  16
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  quake-halflife  -j MARK --set-mark 110
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
110 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  mohaa  -j MARK --set-mark 109
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
109 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  code_red  -j MARK --set-mark 123
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark
123 -j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  bgp  -j MARK --set-mark 1
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  1 -=
j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  socks  -j MARK --set-mark 23
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  23
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  ssdp  -j MARK --set-mark 24
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  24
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  stun  -j MARK --set-mark 27
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  27
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  subversion  -j MARK --set-mark 28
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  28
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  telnet  -j MARK --set-mark 29
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  29
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  tftp  -j MARK --set-mark 30
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  30
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  uucp  -j MARK --set-mark 32
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  32
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  zmaap  -j MARK --set-mark 35
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  35
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  100bao  -j MARK --set-mark 42
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  42
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  smb  -j MARK --set-mark 20
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  20
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  nntp  -j MARK --set-mark 17
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  17
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  ncp  -j MARK --set-mark 15
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  15
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  biff  -j MARK --set-mark 2
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  2 -=
j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  cvs  -j MARK --set-mark 3
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  3 -=
j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  dhcp  -j MARK --set-mark 4
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  4 -=
j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  dns  -j MARK --set-mark 5
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  5 -=
j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  ident  -j MARK --set-mark 10
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  10
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  imap  -j MARK --set-mark 11
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  11
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  ipp  -j MARK --set-mark 12
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  12
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  lpd  -j MARK --set-mark 13
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  13
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  nbns  -j MARK --set-mark 14
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  14
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  applejuice  -j MARK --set-mark 43
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  43
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  ares  -j MARK --set-mark 44
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  44
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  xunlei  -j MARK --set-mark 64
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  64
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  hotline  -j MARK --set-mark 53
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  53
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  soulseek  -j MARK --set-mark 61
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  61
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  imesh  -j MARK --set-mark 54
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  54
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  kugoo  -j MARK --set-mark 55
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  55
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  mute  -j MARK --set-mark 56
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  56
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  napster  -j MARK --set-mark 57
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  57
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  openft  -j MARK --set-mark 58
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  58
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  poco  -j MARK --set-mark 59
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  59
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  goboogy  -j MARK --set-mark 52
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  52
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  gnutella  -j MARK --set-mark 51
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  51
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  gnucleuslan  -j MARK --set-mark 50
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  50
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  thecircle  -j MARK --set-mark 63
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  63
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  bittorrent  -j MARK --set-mark 45
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  45
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  tesla  -j MARK --set-mark 62
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  62
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  directconnect  -j MARK --set-mark 46
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  46
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  edonkey  -j MARK --set-mark 47
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  47
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  fasttrack  -j MARK --set-mark 48
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  48
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  freenet  -j MARK --set-mark 49
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  49
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  soribada  -j MARK --set-mark 60
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  60
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  tsp  -j MARK --set-mark 31
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  31
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  ntp  -j MARK --set-mark 18
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  18
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  rtp  -j MARK --set-mark 78
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  78
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  skypeout  -j MARK --set-mark 95
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  95
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  skypetoskype  -j MARK --set-mark 96
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  96
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  whois  -j MARK --set-mark 34
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  34
-j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  finger  -j MARK --set-mark 6
/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m mark --mark  6 -=
j  ACCEPT
/usr/local/sbin/iptables  -t mangle  -A FORWARD  -j  ACCEPT
# End

When doing yahoo messenger it is http, skype and finger witch are
match enven yahoo is the first rule.
but when  i keep yahoo rule alone yahoo is mach when doing yahoo messen=
ger.
regards.

2011/2/20 Andrew Beverley <andy@andybev.com>:
> On Sun, 2011-02-20 at 15:13 +0000, E2IA wrote:
>> Hi all i'd like to know if it is possible to mark packet and accept =
in
>> the single iptable rule.
>
> There shouldn't be any need to do this.
>
>> i've these 2 rules:
>>
>> /usr/local/sbin/iptables =C2=A0-t mangle =C2=A0-A FORWARD =C2=A0 =C2=
=A0 -m layer7
>> --l7proto =C2=A0yahoo =C2=A0-j MARK --set-mark 74
>> /usr/local/sbin/iptables =C2=A0-t mangle =C2=A0-A FORWARD =C2=A0 =C2=
=A0 =C2=A0-m mark --mark
>> 74 =C2=A0-j ACCEPT
>>
>> but it seam that the second rule is never match.
>
> The second rule *should* be matched. What makes you think that it is
> not? Remember: a packet ACCEPTed in one chain can be DROPed later.
>
> It might be worth you posting your complete set of rules.
>
> Andy
>
>
>
