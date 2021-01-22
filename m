From: Younwook Jang <younwook@gmail.com>
Subject: Use case of nftables + Linux combination as network firewall
Date: Fri, 22 Jan 2021 22:31:54 +0900
Message-ID: <CAEx-Y1-yWpUcfQKe_gkkuEhpRr2Nm59CjRp61dA5-GS8os5ihw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=3KeKn6bpZ2OkvrxvOujJkf9NDeoAM46OHnBoXhOgWRY=;
        b=S8L5NXaHK0Giw0PBbOBCoBuB19dDQGIomInS2m90Cr9gRV6UlKBE3vxz2Z0Fs27xy7
         6lwpkK4TSQfaOJ65RikMTuAICwlWQTSj6h8wg0UfKCvgGaDPaa5w5OagClsWAisJzeGc
         xlts3z2htTWQgd6AOG9ZzCn6MaVlrH31g3xwy2BbhJHclw/88usNp6pEqoN7nnkiaege
         gY7sUW6/KG6sOr+2lXgu8Ai2Oq22MeKx7I7HzSA6b0J8S7/gYxTEt51pith/fI0cZkBa
         C14D9TtZfPjDVglgzAF+VkvWIsC/SqvOLM5ltkEE63d0jy1tMCp6I5LsSYHSuyBG4qTX
         5klQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear netfilter users,

I'm looking that real reference case that uses nftables+Linux server
as network firewall.

Would you please share reference cases or related information ?

I think that Linux VM with well-configured nftables can be act as
network firewall especially cloud environment.

Please share your advice.

thanks, regards.
