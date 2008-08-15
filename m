From: "James King" <t.james.king@gmail.com>
Subject: Re: POM Xtables???
Date: Fri, 15 Aug 2008 01:48:21 -0700
Message-ID: <38bcb3ec0808150148k3af99a55gc4298341221c3c01@mail.gmail.com>
References: <935fab200806271054oa7c340evbf465b7a9984498b@mail.gmail.com>
	 <4866F152.7030109@riverviewtech.net>
	 <935fab200806300904rc7dc7b2kf58ab7893c3ef20a@mail.gmail.com>
	 <486907EA.60105@trash.net>
	 <alpine.LNX.1.10.0806302218500.30639@fbirervta.pbzchgretzou.qr>
	 <48694787.3080906@trash.net>
	 <alpine.LNX.1.10.0807010907040.26892@fbirervta.pbzchgretzou.qr>
	 <4887BCE0.2050902@trash.net>
	 <38bcb3ec0807240131n1f5d4051k9e89731aa2fcb6c9@mail.gmail.com>
	 <488849A5.6050401@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=ae0dAxW68bBSDba9OIxhDY70xLV25pcnCXKFTS1XrXI=;
        b=lZta5Ahlr7rklcQVrlv4ipslBbTlZRW2EcV0OwL4X5WcMrMq0glUbbOzrqXVP+VkH1
         rnBWCmOMhBlOyvpB/vh6kA4Rb+lJf3tavsHCvAGTuojTqryEjOVz0/ivq5aqj6ScmrTN
         rGo9DlsWO7VY2KonaeB7M79dmKGCkaqgaq7mI=
In-Reply-To: <488849A5.6050401@netfilter.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Patrick McHardy <kaber@trash.net>, Jan Engelhardt <jengelh@medozas.de>, Dave <finalglide@gmail.com>, netfilter@vger.kernel.org

On Thu, Jul 24, 2008 at 2:21 AM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> The other choise is userspace by means NFQUEUE. If we use some
> heuristics, we may try to classify the traffic by means of the initial
> data packets and then mark the connection. Thus, the number of packets
> that go to userspace would be small and the classification logic is
> implemented in userspace using whatever regex
> engine/aho-corasick/bit-wise/boyer-moore/bayes whatsoever...

I'm a bit nervous about using the existing mechanisms for userspace
classification.  As I understand it (and correct me if I'm wrong),
network performance could be severely impacted if the system load gets
high (packet is blocked until userspace returns a verdict?).  If so,
even restricting the number of packets going to userspace to the
initial exchange won't solve this problem.

Asynchronous userspace classification on the other hand could be
extremely useful.  If there was a mechanism to fire packets and their
associated conntrack ID to userspace and immediately allow the packet
through unmolested (so that userspace delays wouldn't hinder traffic),
combined with a way to set CONNMARK for an arbitrary conntrack from
userspace after the fact, this type of impact could be greatly
minimized.  The only drawback I can think of would be for very
short-lived flows, where the conntrack has already gone away by the
time userspace makes a decision.
