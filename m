From: "Rafael Dewes" <rafael.dws@gmail.com>
Subject: Re: Iptables - Error: No chain/target/match by that name
Date: Tue, 3 Apr 2007 22:34:40 -0300
Message-ID: <cdcab2540704031834u33de72dfle579ba394570ea6a@mail.gmail.com>
References: <cdcab2540704031418m1c25bf55hbcfabf8340db546b@mail.gmail.com>
	<4612C82D.9020109@mailinator.com>
	<20070403204120.lndmfrhslc0g048w@webmail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=Ll1e8MnIEaGg15e59RuXwEoNFf1A1eDjlDDAJT5RY4jszzYt2g4Z0ZFOBCyFmuuQLzaCXVBrAqu1WBjHd8I5TYFXKNxL4+/yiIsTxa+A8dmw3qQLDaOroJNTfmPq3EAWnAiRdQb1vTsUEhPFTTDRVwhB8jmEY7pXUFRc4eGymGI=
In-Reply-To: <20070403204120.lndmfrhslc0g048w@webmail.harrisonburg.k12.va.us>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> > Try this.
> >
> > iptables -I INPUT -s 192.168.0.0/24 -p tcp -m tcp --dport 21 -j ACCEPT
I tried, but error persists.

> I started getting the same error message a couple of weeks ago.  Does
> it usually mean one of the rules is not good?  Im having a problem
> trying to find the bad rule.
In my case, the firewall dont have any other rule.

-Regards.

