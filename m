From: "Schewe, Jon     RTX" <jon.schewe@rtx.com>
Subject: Filter access to user process sockets
Date: Tue, 30 May 2023 18:21:01 +0000
Message-ID: <105d714b9a754c4c81063a614ad19517@PH1P110MB1148.NAMP110.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rtx.com; h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=POD2020; bh=EAPMw+5Y2561NuK+/+xjpASvckzl1vE7ZpKgdmtnDQ0=;
 b=ehZ7F9ZZ2RAcYJQGMku53v98S4eNRtoIfmokTGesz3iMAWqwOrM0vkiNrWkXXvUwPK+3
 +BWv42Vatim/6cuoXwqm4z73akmb+1r8ox5JpueLzGHS2tns85YOKjcu8jPmv6Op4xug
 JV35pgV9+nb9cIHrkc2gvCtqZcBLpWrdWI9N99Jws5TYK9IodO7C8RoH6fAlLDHUI8xn
 eMx/zZ0whTM0JtY1jcVEzV54O1UcGBnp1Qsf3VuFhKq89u/lRgOMhxGp7sodkBpuYb8p
 VIaQJK2UhUL1z2c5zYJYzSTmpBv4ZZ7B3xUV+92IVlYoQ/iv4JLsiymWcM7FWfbVs+79 Sg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtxusers.onmicrosoft.us; s=selector1-rtxusers-onmicrosoft-us;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAPMw+5Y2561NuK+/+xjpASvckzl1vE7ZpKgdmtnDQ0=;
 b=hSMW4rD0ITA7xbRY4nNPEWFhIDd8Kqi9sy/dPQddTcCqgAkk+lRazejN6oV+GK3TGXKfVGe/1alRrGAbeRR6ZwAsi+T5hhIroLeZ3NCjkTlYWFOy14y41mpZg+KzfOSa0r+WWvU7fWt863UU14eYgyBo9480BmxsyLqQmouyVsk=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I have recently learned about using "meta skgid" and "meta skuid" to limit =
network access based on primary group and user id. I would like to ensure t=
hat a user can only connect to sockets where the uid of the running process=
 matches that user. =0A=
=0A=
Example:=0A=
User A starts web server process on port 8000 in 1 shell=0A=
User A logs into the same host in another shell. Processes running in this =
shell should be able to access localhost:8000=0A=
User B logs into the same host . Processes running in this shell should be =
denied access to localhost:8000.=0A=
=0A=
Ideally I'd like to allow the users access to certain common ports under 10=
24 and any local ports that they create processes on themselves.=0A=
=0A=
Is this something that netfilter can provide? =0A=
=0A=
Thank you for your time=0A=
Jon Schewe=0A=
=0A=
