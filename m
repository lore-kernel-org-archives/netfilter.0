From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: C code rule modifying
Date: Tue, 22 Apr 2008 14:34:29 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804221433020.13697@fbirervta.pbzchgretzou.qr>
References: <5078d3df0804211505u2ab2c584o9e27fdae1a3fdb82@mail.gmail.com>  <alpine.LNX.1.10.0804220041330.13697@fbirervta.pbzchgretzou.qr> <5078d3df0804211613o3213bdeege5054ff95e558d51@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5078d3df0804211613o3213bdeege5054ff95e558d51@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Charles Romestant <cromestant@gmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2008-04-22 01:13, Charles Romestant wrote:
>Ok im trying to add the rule to a table named charz, here is the code :
>
>char *command;
>        FILE *fp = popen("/sbin/iptables",'w');
>        if (fp==NULL){
>        printf("\nerror opening pipe\n");
>        return -1;
>        }else{
>        sprintf(command,"-A charz -p tcp --dport %s --source %s -j
>%s\0",port,currentIp,action2);
>        printf("\n\n\n%s\n\n\n",command);
>        fwrite(command,strlen(command),1,fp);
>        pclose(fp);

(1) sprintf may overflow here
(2) do not call pclose() with fp==NULL (but I suppose it's entirely
in the else block anyway)

but most importantly:
(3) iptables does not read from stdin, so fwrite() is the wrong thing
to start with.
