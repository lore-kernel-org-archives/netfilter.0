From: Vivek Thrivikraman <vivek.thrivikraman@est.tech>
Subject: Query on CLOSED conntrack entry for sctp
Date: Wed, 15 Dec 2021 11:40:38 +0000
Message-ID: <DB8P189MB06011947CC4F1B180AD1CE12E7769@DB8P189MB0601.EURP189.PROD.OUTLOOK.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com;
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yhH1o9hX9NsGRCoARvo4F7WuMaJsBKIiGBqFstu4t/w=;
 b=FJ5ZNCDbnqxzRwsR/QiBeBvVqqUXg5R8Bl6XmnGqC1wsIz2XXRTtIex0J8IoNv7A+WX2yoV2E1475UWpgKuexgkrtlaINxV+A2OyDwdOVjURPesKeQDi7B/0BWuRsdOZskyiCQTMiuZ9DqsFW+BqGGfI2aFlbWiDEg+HB64yBIQ=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi ,

We are having an SCTP server application which is accessed continuously by =
SCTP client application, when the session disconnects the client retries to=
 establish a connection every 7 seconds. The issue that we are seeing is th=
at,when we kill the application serving SCTP and restart it, after the rest=
art of sctp server application also the session is not established because =
of stale conntrack entry with connection state CLOSED as below(removing thi=
s entry manually established new connection) :

sctp=A0=A0=A0=A0 132 9 CLOSED src=3D10.141.189.233 dst=3D10.8.146.193 sport=
=3D10100 dport=3D3868 src=3D192.168.160.22 dst=3D192.168.226.64 sport=3D386=
8 dport=3D64782 [ASSURED] mark=3D0 use=3D1=20

Looks like the CLOSED conntrack entry is getting refreshed and does not exp=
ire because the client is retrying continuously. Shouldn't CLOSED conntrack=
 entry expire irrespective of client retries?

Thanks,
Vivek

