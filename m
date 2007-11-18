From: Jaco Kroon <jaco@uls.co.za>
Subject: Re: nlif_index2name bug?
Date: Sun, 18 Nov 2007 21:55:12 +0200
Message-ID: <474098A0.8070607@uls.co.za>
References: <473EE45F.8040008@uls.co.za> <1195410901.6881.19.camel@localhost> <47408E64.8060901@uls.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47408E64.8060901@uls.co.za>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@vger.kernel.org

Jaco Kroon wrote:
> Eric Leblond wrote:
>   
>> I've just wrote a brief nlif documentation on the following page:
>> http://software.inl.fr/trac/trac.cgi/wiki/articles/using_nlif
>>   
>>     
> This explains things quite a bit.  Very nicely done.
>
> I'm actually using libnetfilter_queue, and am not doing anything
> multi-threaded, would it be sufficient just to call nlif_catch() every
> time I run into an interface for which there is no name and to then
> retry the call?  Alternatively, you mention select(), I'm guessing the
> poll() system call will achieve the same thing?  My reasoning here is
> that everytime just before calling nlif_index2name() to first call
> poll() with a timeout of zero in order to check whether there are
> updates and to then call nlif_catch if there are updates, however, is
> this the most efficient way, since poll() and nlif_catch() both probably
> results in a system call, wouldn't it simply be more efficient to just
> call nlif_catch every time just before calling nlif_index2name?
>
> Also, in the case of poll(), I guess I need to poll for POLLIN?
>   
Ok, so after testing it turns out poll(2) does work quite nicely,
however, I need to call nlif_catch quite a few times to get things to
work nicely, so now I've basically got this piece of code just before
nlif_index2name():

while (poll(&nlif_poll, 1, 0) > 0) {
    log (LOG_INFO, "Calling nlif_catch due to device changes.");
    nlif_catch(nlif);
}

And it turns out that simply restarting ppp0 causes quite a few events:

[INFO]: Calling nlif_catch due to device changes.
[INFO]: Calling nlif_catch due to device changes.
[INFO]: Calling nlif_catch due to device changes.
[INFO]: Calling nlif_catch due to device changes.
[INFO]: Calling nlif_catch due to device changes.
[INFO]: Calling nlif_catch due to device changes.
[INFO]: Calling nlif_catch due to device changes.
[INFO]: Calling nlif_catch due to device changes.
[INFO]: Calling nlif_catch due to device changes.
[INFO]: Calling nlif_catch due to device changes.
[INFO]: Calling nlif_catch due to device changes.
[INFO]: Calling nlif_catch due to device changes.
[INFO]: Calling nlif_catch due to device changes.
[INFO]: Calling nlif_catch due to device changes.
[INFO]: Setting device ppp0(9) to cap 2.

Not sure what's causing all those events but it works correctly now, thanks.

Jaco
