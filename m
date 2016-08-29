From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: Bigger packet after mangling queued packets
Date: Mon, 29 Aug 2016 23:17:50 +0300
Message-ID: <CAEzD07JNkUbL6U-y9UrcMUysQCD9hW3oxVUbGOmNkpp0JCx2pA@mail.gmail.com>
References: <CAAU8gNxtr=fNapaB0wh_4AySxbzF8JxLa46D1WdwzomA9rFnHQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=xJZ/nx/O3hhMwnD8KRvj4aBksAA9FjCB6rpPbcQ/F8o=;
        b=dTHle8+5sSmcnKDGWpcZcBj6hvU08S0IAkE5J7pFLegD52SioItAZkt4M6CfzY4MYs
         arHgCleM5iddtBs7WRoAwHdhC45iB4oO7DmmxMkt3WhKpAcjObSSbvc4UEZ2DQyAY/27
         e2btPt32niHcqm+C3lfn1mk/6RsZqW0LU+tyXcaTLFK+kq0aEXKTcPv4uaLZPq9i8bta
         vDgQbjXiIR7p9cf172CfbqaQkcaVD1Xnd7YUi6d0vHpjh3Tn819I8XZ/5cPSZZuWowsM
         cXEUQWDtB/kz+zzV6lgjaATHnIMLmu4ZP/k+9xEISwF5F379dXXD4qfTTwzVKjpfrF5Q
         64Dg==
In-Reply-To: <CAAU8gNxtr=fNapaB0wh_4AySxbzF8JxLa46D1WdwzomA9rFnHQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre-Antoine BRAMERET <pa.brameret@gmail.com>
Cc: netfilter@vger.kernel.org

Hi.

Check the outgoing traffic with tcpdump on machine A, and check the
offloads on machine B.

2016-08-29 19:12 GMT+03:00 Pierre-Antoine BRAMERET <pa.brameret@gmail.com>:
> Hi,
>
>
> I recently discovered netfilter_queue, and have a question about
> changing the packet size before accepting it. What happens when the
> accepted packet is now too large and would require splitting?
>
> I have tested the following situation. Computer A filters outgoing UDP
> packets toward a given port and multiple by 10 their payload before
> accepting them. An app sends a packet from A to computer B, which is
> reachable through a LAN. The MTU of the corresponding ethernet devices
> is 1500. I sent a packet with an initial payload of 200 bytes, which
> is correctly multiplied by 10 by my filter callback, and gives a
> single IP packet of more than 2000 bytes. On computer B, I see through
> tcpdump that a single packet arrives, with an erroneous IP header
> (total length is 1500, packet is marked as fragmented), but a correct
> UDP header (length is 2008 bytes). The 2000 bytes of UDP payload are
> correctly received by the socket on computer B. How would that happen?
>
> I have seen the discussion about what may happen to a packet that is
> larger (http://marc.info/?l=netfilter&m=133494380818412), is this the
> case here?
>
>
> Many thanks,
> --
> BRAMERET Pierre-Antoine
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Anton.
