From: =?utf-8?b?0J/RkdGC0YAg0JLQvtC70LrQvtCy?=
	=?utf-8?b?INCQ0LvQtdC60YHQsNC90LTRgNC+0LLQuNGH?= <torre_cremata@mail.ru>
Subject: Re: SSH Brute force attacks
Date: Sun, 22 May 2005 11:11:35 +0400
Message-ID: <200505221111.35382.torre_cremata@mail.ru>
References: <427B93EE.3030905@eccotours.dyndns.org>
	<200505211200.28314.pvolkov@mics.msu.su>
	<428FB81F.6030403@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <428FB81F.6030403@riverviewtech.net>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

Thank you for your answer Grant.

22 =D0=9C=D0=B0=D0=B9 2005 02:37 Taylor, Grant wrote:
> > Why this update here (see below)?
> >
> > $ipt -A SSH_Brute_Force -m recent --name SSH --update
> >
> > Every time packet passed --set rule it updates SSH. So if drop this rul=
e,
> > nothing changes. Or am I wrong? Is there any idea behind this that I
> > missed.
>
> The "--set" rule is required because the testing that I did the "--update"
> rule would not effectively do the same thing as "--set" because there was
> no initial "--set" to be updated.  It's sort of a chicken and egg problem
> where you can not successfully have one with out having the other in this
> scenario.  The only draw back to having the "--set" that I'm aware of is
> that the hit count is incremented once per "--set" and "--update" thus you
> have to double the "--hitcount" value that you want to match against.

I feel myself stupid. I'll try to explain my question again, so if you have=
=20
some time to pay me attention, may be you can help me. Any way thank you fo=
r=20
your time.

 I'd like to comment already posted on the list scenario step by step to ma=
ke=20
my question a bit clearer.

Here we create chain and put all ssh syn trafic there:
1. $ipt -N SSH_Brute_Force
2. $ipt -A INPUT -p tcp --dport 22 -m state --state NEW -s ! $MyIP -j=20
SSH_Brute_Force

Now in our SSH_Brute_Force chain we need to add source address in list with=
=20
=2D-set command:
3. $ipt -A SSH_Brute_Force -m recent --set --name SSH

The rule above also updates last seen time. So now we can --rcheck list to =
see=20
how many matches were there (--hitcount ) in the last --seconds.
4. $ipt -A SSH_Brute_Force -m recent ! --rcheck --name SSH --seconds 60=20
=2D-hitcount 3 -j RETURN

As we have negative (!) in the previous rule, so we are comming here. My=20
question is. As we already updated list of matches in 3. why we need to=20
=2D-update list again? Did I missed something? May be there are some unknow=
 to=20
me problems people experince without next rule:
5. $ipt -A SSH_Brute_Force -m recent --name SSH --update

And of course we drop all unwanted packets...
6. $ipt -A SSH_Brute_Force -j DROP

I'm sorry for boring details. I just want to check that I did not missed=20
anything. I've check that rules above are working without 5. But I saw two=
=20
scripts here with this rule. Why you are using it?

=2D-=20
Peter.

