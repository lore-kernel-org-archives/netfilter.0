From: Dave <finalglide@gmail.com>
Subject: Re: POM Xtables???
Date: Mon, 30 Jun 2008 09:04:07 -0700
Message-ID: <935fab200806300904rc7dc7b2kf58ab7893c3ef20a@mail.gmail.com>
References: <935fab200806271054oa7c340evbf465b7a9984498b@mail.gmail.com>
	 <alpine.LNX.1.10.0806272003170.12725@fbirervta.pbzchgretzou.qr>
	 <4866F152.7030109@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=JZz5NoiJM1/N/KQJWiN5jyoxfwtJco4pf9VPNQofPeQ=;
        b=TpAmPYbLw73LPRuNW1LPalwPQwBtjZVy8X3l0ApcL0/uDOzwfNTunuwxERj/A+eWeX
         xsmhyB/KvvhKqxOpg2b3kMwtlIx1h7cvcVSFKtFhdiGJjsQoR6yhIf+uyn0qLBzVO+IJ
         +Io0vJDOHytlEVbcJaQpyELxQyu4FBTuFmWt4=
In-Reply-To: <4866F152.7030109@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

Over the weekend I managed to get the Xtables-addons working with
Kernel 2.6.25.  Throughout this process many questions have come up
that were unanswered by the documentation or Netfilter site.  I'll
point them out.

1) Confusion on just what Xtables is.  Is Xtables really just
Iptables?  It seems to be, but there is nothing saying so officially.
2) Is Xtables the same things as Xtables-addons, Jan in your
directory, the files go from Xtables..... to Xtables-addons.... , does
this mean they are the same thing or different?
3) Still don't know where Xtables-addons fits in with Netfilter?  Why
is Xtables not on the Netfilter site or even mentioned there at all?
What does the core Netfilter team think of Xtables-addons?
4) How does one patch for ACCOUNT and IPSET?  I couldn't find any
modules for Xtables-addons to patch for these extensions, although I
did find mention of a xt_account extension, but couldn't find any
download or anyway to add it to addons.  I had to patch ACCOUNT and
IPSET with Patch-O-Matic.  It seems we really have to use both these
patchers to get everything.
5) Who wrote the extensions for Xtables-addons?  If there is a problem
with any of them where do we report, looking through the source I
couldn't find any writers or maintainers.
6) Currently the extensions and patching systems seems to be a
hodge-podge of items, all with different web sites, maintainers and
writers, from a newbie perspective it's confusing, would be nice if it
was wrapped up into something more straitforward. Hopefully this is
what Xtables-addons is doing, BUT would be really nice if this all
started officially at Netfilter.org.


Hopefully this helps.
Thanks for the great network utilities!
-Dave

On Sat, Jun 28, 2008 at 7:20 PM, Grant Taylor <gtaylor@riverviewtech.net> wrote:
> On 6/27/2008 1:58 PM, Jan Engelhardt wrote:
>>
>> (there is also an easy --but unimplemented-- way to patch a kernel if you
>> want to have it built-in)
>
> Can I get some more information or pointers on what to read about including
> things in the kernel?
>
>
>
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
