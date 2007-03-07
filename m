From: Sebastien Tricaud <sebastien.tricaud@wengo.com>
Subject: Re: [libipq] owner of packet, possible patch
Date: Wed, 07 Mar 2007 15:46:22 +0100
Message-ID: <45EED03E.8000006@wengo.com>
References: <619420780703060739k18ec820dnc8f681b8fc517825@mail.gmail.com>	<1173196307.23222.17.camel@localhost>
	<5e70f6530703061017h655c8861q3b2cf4a0e92dee05@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5e70f6530703061017h655c8861q3b2cf4a0e92dee05@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: TheGesus <thegesus@gmail.com>
Cc: netfilter@lists.netfilter.org, Eric Leblond <eric@inl.fr>

TheGesus wrote:
> On 3/6/07, Eric Leblond <eric@inl.fr> wrote:
>
>> ipqueue is deprecated in favor of libnetfilter_queue ...
>
> Oddly, our friends over at SourceFire are still using libipq for snort
> inline for some unknown reason.
> You should drop them a note on this subject and let them know the
> error of their ways.  I'm sure they'd appreciate it.

This is a total lack of knowledge from your side. Please go to the
following URL :

http://prdownloads.sourceforge.net/snort-inline/snort_inline-2.6.1.2-BETA1.tar.gz?download

Extract source code and grep for libnetfilter_queue inside. You will
find they are using it.

>
> While you're at it maybe you can convince them to stop linking against
> that ancient version of libnet they're so fond of.
>

There might be a reason you are not aware of. Why don't you ask them ?



Love,
Sebastien.


----
Envie d'etre gentil ?
Insultron v.2! http://www.nospoon.org/misc/insultron2.html


