From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: physdev match
Date: Wed, 22 Sep 2004 14:01:22 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1403218a0409220401158fd1ed@mail.gmail.com>
References: <1403218a04092203537a1bbd0c@mail.gmail.com>
	<200409221158.19795.gdh@acentral.co.uk>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409221158.19795.gdh@acentral.co.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Gavin Hamill <gdh@acentral.co.uk>, netfilter <netfilter@lists.netfilter.org>

ummm
I was looking at the possibilities.
Also, what if I don't want to use ebtables !!


On Wed, 22 Sep 2004 11:58:19 +0100, Gavin Hamill <gdh@acentral.co.uk> wrote:
> On Wednesday 22 September 2004 11:53, Mohamed Eldesoky wrote:
> > Anyone know a patch for adding the physdev match to 2.4.21 kernels ??
> > RHEL3U3.
> 
> I have no idea what changes RHEL3 brings to the table, but in the 2.4 series
> no physdev match was required or necessary, because the 'bridge-nf' and later
> 'ebtables' patches for 2.4.x. let "-i eth0" and friends work just fine on
> bridged devices, as if they were not bridged.
> 
> Cheers,
> Gavin.
> 
> 



-- 
Mohamed Eldesoky
www.eldesoky.net
RHCE

