From: Philip Craig <philipc@snapgear.com>
Subject: Re: C code rule modifying
Date: Tue, 22 Apr 2008 11:05:04 +1000
Message-ID: <480D39C0.4000102@snapgear.com>
References: <5078d3df0804211505u2ab2c584o9e27fdae1a3fdb82@mail.gmail.com>	 <alpine.LNX.1.10.0804220041330.13697@fbirervta.pbzchgretzou.qr> <5078d3df0804211613o3213bdeege5054ff95e558d51@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5078d3df0804211613o3213bdeege5054ff95e558d51@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Charles Romestant <cromestant@gmail.com>
Cc: Jan Engelhardt <jengelh@computergmbh.de>, netfilter@vger.kernel.org

Charles Romestant wrote:
> Ok im trying to add the rule to a table named charz, here is the code :
> 
> char *command;
>         FILE *fp = popen("/sbin/iptables",'w');

That should be "w" (a string, not a char).

>         if (fp==NULL){
>         printf("\nerror opening pipe\n");
>         return -1;
>         }else{
>         sprintf(command,"-A charz -p tcp --dport %s --source %s -j
> %s\0",port,currentIp,action2);
>         printf("\n\n\n%s\n\n\n",command);
>         fwrite(command,strlen(command),1,fp);
>         pclose(fp);

If that still doesn't fix it then use valgrind to find the
exact line number.

