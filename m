From: SoulBlazer <soul@lamp-post.net>
Subject: Re: PPTP/GRE + Newnat Issues
Date: Thu, 13 Jun 2002 15:23:57 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020613193250.A1684504E@lists.samba.org>
References: <E131E9F1848D0148813EAF06A846608F615DB2@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <E131E9F1848D0148813EAF06A846608F615DB2@w2ks-e2k.iconos.be>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Sneppe Filip <Filip.Sneppe@cronos.be>, netfilter@lists.samba.org

My default policy in this test environment is ACCEPT for all chains and 
tables (should this matter?).

(~)# : iptables -t nat -L -nv |grep policy
Chain PREROUTING (policy ACCEPT 17915 packets, 2673K bytes)
Chain POSTROUTING (policy ACCEPT 9 packets, 471 bytes)
Chain OUTPUT (policy ACCEPT 9 packets, 471 bytes)

(~)# : iptables -t filter -L -nv |grep policy
Chain INPUT (policy ACCEPT 34018 packets, 4320K bytes)
Chain FORWARD (policy ACCEPT 747 packets, 337K bytes)
Chain OUTPUT (policy ACCEPT 3413 packets, 478K bytes)

(~)# : iptables -t mangle -L -nv |grep policy
Chain PREROUTING (policy ACCEPT 34849 packets, 4664K bytes)
Chain INPUT (policy ACCEPT 34095 packets, 4326K bytes)
Chain FORWARD (policy ACCEPT 747 packets, 337K bytes)
Chain OUTPUT (policy ACCEPT 3452 packets, 482K bytes)
Chain POSTROUTING (policy ACCEPT 4199 packets, 818K bytes)

On June 13, 2002 02:11 pm, Sneppe Filip wrote:
> Hi,
>
> What happens if you explicitly allow the GRE protocol ?
>
> iptables -A FORWARD -p 47 -j ACCEPT
>
> It shouldn't be needed if you let through RELATED connections though...
>
> Regards,
> Filip
>
> -----Original Message-----
> From:	SoulBlazer [mailto:soul@lamp-post.net]
> Sent:	Thu 13/06/2002 18:26
> To:	netfilter@lists.samba.org
> Cc:
> Subject:	Re: PPTP/GRE + Newnat Issues
> I have received private email's regarding similar occurrences.  Perhaps
> there is some weirdness about since I am not alone on this?
>
> Additionally if this is a problem with the module should I move this
> conversation to the netfilter-devel list ? opinions ?

