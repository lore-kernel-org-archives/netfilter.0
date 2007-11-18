From: Jaco Kroon <jaco@uls.co.za>
Subject: Re: nlif_index2name bug?
Date: Sun, 18 Nov 2007 21:11:32 +0200
Message-ID: <47408E64.8060901@uls.co.za>
References: <473EE45F.8040008@uls.co.za> <1195410901.6881.19.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1195410901.6881.19.camel@localhost>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@vger.kernel.org

Eric Leblond wrote:
> Hi,
>
> Le samedi 17 novembre 2007 =E0 14:53 +0200, Jaco Kroon a =E9crit :
>  =20
>> Hi guys,
>>
>> I've seen an error in nlif_index2name, specifically, if an interface
>> comes up _after_ I've opened the nlif_handle (using nlif_open()) the=
n it
>> won't resolve the index of that device to a name.
>>
>> Is this a known issue, a bug or simply me not understanding how nlif
>> works?
>>    =20
>
> Yes, you did not understand how nlif is working (but I think this is =
due
> to the lack of documentation). If fact, you have omit to listen to if=
ace
> events and to call nlif_catch after each event.
>  =20
Ah thanks.
> For a working code example, you can have a look at NuFW's code. nlif
> related code is always prefixed by:
> #ifdef HAVE_NLIF_CATCH
>
> You can browse code online at:
> http://software.inl.fr/trac/trac.cgi/browser/mirror/edenwall/nufw/tru=
nk/nufw/src/nufw/packetsrv.c
> http://software.inl.fr/trac/trac.cgi/browser/mirror/edenwall/nufw/tru=
nk/nufw/src/nufw/iface.c
>  =20
This isn't a particularly "short" example and can probably be simplifie=
d
a lot, not true?  It's good enough for me though, so thank a million fo=
r
pointing me to it.
> I've just wrote a brief nlif documentation on the following page:
> http://software.inl.fr/trac/trac.cgi/wiki/articles/using_nlif
>  =20
This explains things quite a bit.  Very nicely done.

I'm actually using libnetfilter_queue, and am not doing anything
multi-threaded, would it be sufficient just to call nlif_catch() every
time I run into an interface for which there is no name and to then
retry the call?  Alternatively, you mention select(), I'm guessing the
poll() system call will achieve the same thing?  My reasoning here is
that everytime just before calling nlif_index2name() to first call
poll() with a timeout of zero in order to check whether there are
updates and to then call nlif_catch if there are updates, however, is
this the most efficient way, since poll() and nlif_catch() both probabl=
y
results in a system call, wouldn't it simply be more efficient to just
call nlif_catch every time just before calling nlif_index2name?

Also, in the case of poll(), I guess I need to poll for POLLIN?

Thanks for the help and explanation so far,

Jaco
