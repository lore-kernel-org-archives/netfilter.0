From: Patrick McHardy <kaber@trash.net>
Subject: Re: iptables ip_conntrack_ftp + proftpd TLS: PORT command not understood
Date: Mon, 26 May 2008 22:41:13 +0200
Message-ID: <483B2069.7010504@trash.net>
References: <483B0E5E.4010209@gmail.com> <483B11DF.3050904@bofhland.org> <483B16F7.2010205@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <483B16F7.2010205@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: filippozeus@gmail.com
Cc: netfilter@vger.kernel.org

Filippo Zeus wrote:
> thanks for your help at first !
>
> yes. and i've tested tons of clients (ftp-ssl, filezilla, hated M$-IE).
> unfortunatly tcpdump has confirmed my prefeeling.
> Also, reading at proftpd log i can see that encrypted channel is 
> switched off after PASS command
> and stay on only for the data channel.
>
> I'm not shure, cause i'm not a developer, but i think that 
> ftp_conntrak module open a port *ONLY* if
> it read first the USER command, then the PASS command, then PASV/PORT 
> commands
> not simply if a (cleartext) PORT command came from the ftp client. 

Please send a tcpdump.
