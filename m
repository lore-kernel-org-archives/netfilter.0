From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: why can't use connlimit ??
Date: Fri, 28 Oct 2005 11:02:26 +0200 (CEST)
Message-ID: <50262.193.173.147.3.1130490146.squirrel@webmail.sterenborg.info>
References: <43a0cdcb0510272319m69a7a1d4g@mail.gmail.com>
	<64005.193.173.147.3.1130483580.squirrel@webmail.sterenborg.info>
	<43a0cdcb0510280027x6236afeco@mail.gmail.com>
	<50475.193.173.147.3.1130485511.squirrel@webmail.sterenborg.info>
	<43a0cdcb0510280051u1fd2aabcv@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43a0cdcb0510280051u1fd2aabcv@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

On Fri, October 28, 2005 09:51, Buddy wu wrote:
...
> kernel version is 2.6.10, and I download from www.kernel.org
> use the POM-20050801 or 20051025. they have the same problem
...
> But I'm puzzled with the errors. it said that the object don't have
> 'proto' member(the conflicting POM patches can make out these errors?
> I think the structure should be same ).

What if you try with the latest POM and kernel (20051027 and 2.6.14
resp.) ?

I'm not a programmer so if this won't work, I don't know. I also find
it strange that you do have a .so, but not a .ko file.


Gr,
Rob




