From: Simon <tanstaafl@libertytrek.org>
Subject: Re: Log flooded with these...
Date: Sun, 19 Oct 2008 12:48:13 -0400
Message-ID: <48FB64CD.6070205@libertytrek.org>
References: <48FB4FD8.7090307@libertytrek.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48FB4FD8.7090307@libertytrek.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/19/2008, Simon (tanstaafl@libertytrek.org) wrote:
> Oct 19 11:10:33 myhost IPTABLES-IN Default Drop: IN=eth0 OUT=
> MAC=ff:ff:ff:ff:ff:ff:00:1c:c0:69:16:89:08:00 SRC=0.0.0.0
> DST=255.255.255.255 LEN=328 TOS=0x00 PREC=0x00 TTL=128 ID=46967
> PROTO=UDP SPT=68 DPT=67 LEN=308
> Oct 19 11:10:33 myhost IPTABLES-IN Default Drop: IN=eth0 OUT=
> MAC=ff:ff:ff:ff:ff:ff:00:04:5a:8f:d6:11:08:00 SRC=192.168.1.250
> DST=255.255.255.255 LEN=347 TOS=0x00 PREC=0x00 TTL=128 ID=55784
> PROTO=UDP SPT=67 DPT=68 LEN=327
> Oct 19 11:10:33 myhost IPTABLES-IN Default Drop: IN=eth0 OUT=
> MAC=ff:ff:ff:ff:ff:ff:00:1c:c0:69:16:89:08:00 SRC=0.0.0.0
> DST=255.255.255.255 LEN=360 TOS=0x00 PREC=0x00 TTL=128 ID=46968
> PROTO=UDP SPT=68 DPT=67 LEN=340

Help! I'm not an iptables guy... at a minimum, is there a way to just
tell iptables to stop logging these (silently drop)? I'll continue to
troubleshoot, if there is a problem, but this is making my logs
virtually (not totally, but almost) useless...

Also, I guess it would be good to have the reverse command handy - how
to turn this off and on, so I can test if the problem persists...

Thanks
