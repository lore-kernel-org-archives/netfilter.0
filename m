From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: RE : Some webpages inaccessible through IPTables
Date: Sat, 8 Feb 2003 21:28:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030208212820.7b24ce03.arnt@c2i.net>
References: <20030208153456.424A223F1C@www.fastmail.fm>
	<001401c2cf8a$fb5bf760$fd42a8c0@zoccolo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001401c2cf8a$fb5bf760$fd42a8c0@zoccolo.com>
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

On Sat, 8 Feb 2003 16:58:54 +0100, 
"Franck ZOCCOLO" <franck@zoccolo.com> wrote in message 
<001401c2cf8a$fb5bf760$fd42a8c0@zoccolo.com>:

> > -----Message d'origine-----
> > De : netfilter-admin@lists.netfilter.org 
> > [mailto:netfilter-admin@lists.netfilter.org] De la part de Sven Bolt
> > Objet : Re: Some webpages inaccessible through IPTables
> > 
> > 
> > No ECN is not enabled in the kernel. The sites are accessible from
> > the gateway itself so it's not an MTU issue. What else could it be?
> You're wrong... THIS is an MTU issue... I bet you're using PPPoE to
> connect to the internet. This problem should be handled by MTU path
> discovery, but some stupid network administrators are blocking all
> ICMP packets, and MTU path discovery uses ICMP to do its job.
> 
> Try lowering the MTU of your client hosts to 1492, and you'll be able
> to browse the sites you cannot access for now.

..if that doesn't work, keep on lowering it.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



