From: "Charles Romestant" <cromestant@gmail.com>
Subject: Re: C code rule modifying
Date: Tue, 22 Apr 2008 18:43:09 +1930
Message-ID: <5078d3df0804211613o3213bdeege5054ff95e558d51@mail.gmail.com>
References: <5078d3df0804211505u2ab2c584o9e27fdae1a3fdb82@mail.gmail.com>
	 <alpine.LNX.1.10.0804220041330.13697@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=0FyqrN3Rhv2Gs+QaFPDGzUpiOBW5b79WMIbkMn0DX2A=;
        b=BPCU5HgbJCZGLhEziuoq2o/4jitXSUTSj9kg4zNefg+CSTO/7AtVCoQPFeZ96ooTmIUazOlezG9SSMJFucr6dseAQkdjShcK5bkvjCd0iUMWUqB2tFViPxcDTs8vy4c2dE3S/Je9Eyh/cE7OoiVqSKQ9oRJqSffKrnAuf7hrxoY=
In-Reply-To: <alpine.LNX.1.10.0804220041330.13697@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: netfilter@vger.kernel.org

Ok im trying to add the rule to a table named charz, here is the code :

char *command;
        FILE *fp = popen("/sbin/iptables",'w');
        if (fp==NULL){
        printf("\nerror opening pipe\n");
        return -1;
        }else{
        sprintf(command,"-A charz -p tcp --dport %s --source %s -j
%s\0",port,currentIp,action2);
        printf("\n\n\n%s\n\n\n",command);
        fwrite(command,strlen(command),1,fp);
        pclose(fp);


that is all...
commenting out the popen code and just printing command gives out
folowing output:

-A charz -p tcp --dport 22 --source 10.0.1.197 -j ACCEPT


thank you for your answer

ps: this is just a sample of the code, since there are pcap modules
and crypto modules also.
On Tue, Apr 22, 2008 at 6:12 PM, Jan Engelhardt <jengelh@computergmbh.de> wrote:
>
>  On Tuesday 2008-04-22 00:05, Charles Romestant wrote:
>
>  >Hello, anyone happen to have some C sample code to modify existing
>  >ruleset, can t seem to get it to work with
>  >popen ( get segfault) even running as root.
>
>  Uh, if you get a segfault with a simple popen, there's likely
>  a bug in your code. (Suggestion to post the offending lines.)
>



-- 
Charz
