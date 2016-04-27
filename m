From: Satish Patel <satish.txt@gmail.com>
Subject: Re: Build firewall with millions pps support
Date: Wed, 27 Apr 2016 11:29:30 -0400
Message-ID: <CAPgF-fos=c0Equ-YUDrOSzJ-MDWPkax9E2HBnKYVpZAVg9yHyA@mail.gmail.com>
References: <CAPgF-foyqY7_UbQVK7R4vU5MRP0XsfgXAjpQUNwNROZVq9YxDQ@mail.gmail.com>
	<CA+hQ2+ja5bRqH301R1q0ThKNno87yUHVCCc8pfvPVMFW48sDiw@mail.gmail.com>
	<CAPgF-fpwkShxm4uHV8vuzAsHC9C8=Ske-MY14axtWxELvZvCZA@mail.gmail.com>
	<881ec44b-22db-4f37-828d-cb8c0994131d@Spark>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc;
        bh=CRP5GA3tAUiB2yhMJJ6DnasHdXJabZuDucg8s2B/6Kg=;
        b=HYciDYzlhcS4o4DC8ThRC4neUgXy/2UoJXOukls1pdWcEh/3ek91R48hdUb3SJHAyH
         kztTK5naddBjny8wLORg6oSEHhGFo7+Ikxx2VZuApLgm8pJOjkKHSl6o9qbjNvkvB8KI
         U8IR9ZEnqyui32yypb/yb7nNBjzbbQyPyup7p9eNJVwrlKU97ViuZAUON3zZ7VBoJeYx
         /X7AY8mniBfXtVijpE4plyt6EjZlHMCox4eBNQ73V7Fmw/bv/yOdltq9CSeZvAJRCl1Q
         C4ufHPPWP5cnqImhhNH10b514hvI6QXTP5vJACZOEUnVkB+GWqui3itoZ726fqdOwH8n
         aytA==
In-Reply-To: <881ec44b-22db-4f37-828d-cb8c0994131d@Spark>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Payam Chychi <pchychi@gmail.com>
Cc: Luigi Rizzo <rizzo@iet.unipi.it>, netfilter@vger.kernel.org

already did lots of and more you google more you get confused.. They
are many many kind of NIC out there and everyone is slide differ from
other thats why thought lets ask experts so i can save time and money
to because i don't want to buy something buy mistake which look fancy
by description. Anyway thanks for advice :)

On Wed, Apr 27, 2016 at 11:08 AM, Payam Chychi <pchychi@gmail.com> wrote:
>
>
> On Apr 27, 2016, 8:03 AM -0700, Satish Patel <satish.txt@gmail.com>, wrote:
>
> How about this Intel NIC
> http://www.intel.com/content/dam/doc/product-brief/ethernet-x520-server-adapters-brief.pdf
>
> Does it support Multi Queue?
>
> On Wed, Apr 27, 2016 at 2:13 AM, Luigi Rizzo <rizzo@iet.unipi.it> wrote:
>
> you may want to look at github.com/luigirizzo/netmap-ipfw ,
> it is a version of FreeBSD's ipfw+dummynet which runs on top
> of netmap.
>
> This works on both Linux and FreeBSD
>
> Re. cards in my experience the Intel cards (the old X520
> based on the 85299, and the newer X710 based on the new chipset)
> are both decent (I have a slight preference for the older,
> which I find more performant)
>
> cheers
> luigi
>
>
> On Wed, Apr 27, 2016 at 5:20 AM, Satish Patel <satish.txt@gmail.com> wrote:
>
>
> Planning to build stateless firewall which support 10GE link with
> handling 2 million packet per second, need following suggestion from
> folks
>
> 1. Which OS i should use? (BSD or Linux?)
> 2. what type of 10GE NIC i should pick to achieve high Mpps (multiqueue
> etc.)
> 3. what should i use for bypass kernel (I heard from googling people
> saying use this technique).
> 4. what kind of server i should pick?
>
> We are build this firewall to stop bad traffic at front door and DDoS
> (specially flooding and UDP IP Fragmentation stype)
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
>
>
>
>
>
> --
> -----------------------------------------+-------------------------------
> Prof. Luigi RIZZO, rizzo@iet.unipi.it . Dip. di Ing. dell'Informazione
> http://www.iet.unipi.it/~luigi/ . Universita` di Pisa
> TEL +39-050-2217533 . via Diotisalvi 2
> Mobile +39-338-6809875 . 56122 PISA (Italy)
> -----------------------------------------+-------------------------------
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
>
>
>
>
> Mate, how about you use the power of google and do some actual research
> insted of asking for people to hold your hand without any prior work done by
> yourself?
>
>
