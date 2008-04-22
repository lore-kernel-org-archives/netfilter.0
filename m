From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: C code rule modifying
Date: Tue, 22 Apr 2008 10:59:22 +0300
Message-ID: <1208851162.15101.1.camel@casper.meteor.dp.ua>
References: <5078d3df0804211505u2ab2c584o9e27fdae1a3fdb82@mail.gmail.com>
	 <alpine.LNX.1.10.0804220041330.13697@fbirervta.pbzchgretzou.qr>
	 <5078d3df0804211613o3213bdeege5054ff95e558d51@mail.gmail.com>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5078d3df0804211613o3213bdeege5054ff95e558d51@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Charles Romestant <cromestant@gmail.com>
Cc: Jan Engelhardt <jengelh@computergmbh.de>, netfilter@vger.kernel.org

=F7 =F7=D4=CF, 22/04/2008 =D7 18:43 +0000, Charles Romestant =D0=C9=DB=C5=
=D4:
> Ok im trying to add the rule to a table named charz, here is the code=
 :
>=20
> char *command;

This is first segfault, change to this:

char command[1024];

>         FILE *fp =3D popen("/sbin/iptables",'w');
>         if (fp=3D=3DNULL){
>         printf("\nerror opening pipe\n");
>         return -1;
>         }else{
>         sprintf(command,"-A charz -p tcp --dport %s --source %s -j
> %s\0",port,currentIp,action2);
>         printf("\n\n\n%s\n\n\n",command);
>         fwrite(command,strlen(command),1,fp);
>         pclose(fp);

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

