From: Michael Stilmant <ml-netfilter@adtech.be>
Subject: RE: transparent tcp proxy
Date: 27 May 2003 13:48:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054036083.18151.86.camel@stilmant>
References: <09B04A55822EFF4DA48D2E0BB2941D4A019241@wardrive.citadelcomputer.com.au>
	 <1053938722.17259.6.camel@stilmant>
	 <1054024461.694.31.camel@elendil.intranet.cartel-securite.net>
	 <1054028975.18150.65.camel@stilmant>
	 <1054032554.681.103.camel@elendil.intranet.cartel-securite.net>
Reply-To: ml-netfilter@adtech.be
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054032554.681.103.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 2003-05-27 at 12:49, Cedric Blancher wrote:

> [...] possible using fwmark propagation.
> 
>       iptables -t mangle -A OUTPUT -p tcp --sport Y -d A --dport X \
>               -j MARK --set-mark 0x01
> 
> Then, you SNAT in POSTROUTING using ebtables marked packets :
> 
>       ebtables -t nat -A POSTROUTING -m mark_m --mark 0x01 \
>               -j snat --to-source C_MAC
> 

wow this sound not pretty bad .. thanks I'll test this in some times
(need to finish one work before, so I'll tell you if this work) but if
other have others solutions (in case)

Merci ;-)


> You didn't get any other answer for this on
> ebtables-user list ?

no except your other one :-) (which tell me to read features page, :-D )
but I was testing if there are some potentials solution only with
iptables ... and one another solution is perhaps (perhaps !) to have
some IOCTL command on socket to force by this channel to use a specific
MAC address .. 


Best regards

Michael


