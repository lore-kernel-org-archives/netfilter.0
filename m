From: Max Ehrlich <max.ehr@gmail.com>
Subject: Simplifying DNAT Rules using Maps
Date: Wed, 3 Jun 2020 12:08:50 -0400
Message-ID: <CAPyx93x8RtJA8ghab2W630WwpHZP+K-dA26SWkj7+wstasM5mw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=qNfew/bpoyjoGfZv50FcKnQtowwmeR0D3JHGqzQfyAk=;
        b=WBFxOKOa3yaUV3QklkoltbF30NdE9p+iMU8Dt/i7yz5rMJy3rCl+YGLAcXG3N3J4GM
         x7yUy5r0UuaiJAzLfdeq9TrxDHbLEes2u8cVDjrhOaY+fFF7Rsiwd904+xqVFXXUKH81
         AWeNie2HRUy03ginGLfpedxwTxTBIyatuMsjov9GQcOqNNzx+r5MDBLsQ7KzboQRrWdc
         tghUxLqrsuhpXCd9tIYvHeYB/jGPfQ6gi7MUGUHrHsNByJkbaqRdKjFM4Vz4qFSdD6U+
         a9UAYK6joTdlRVs8TMivv4QesfkJOduEILhzN3PCd/OBQVljZex5fHvQLiWdFpURz5EN
         wRSA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm switching from iptables to nftables, specifically from a high
level translator (awall) to using nftables directly since the
scripting environment is so expressive.

I have quite a few ipv4 DNAT rules that I need to translate, and they
all have a similar form like the following for a web service:

table ip nat {
  chain prerouting {
    ip daddr != 10.0.0.0/8 fib daddr type local tcp dport http dnat
10.1.1.112:8080
  }

  chain postrouting {
    ip saddr 10.0.0.0/8 ip daddr 10.1.1.112 tcp dport 8080 masquerade
  }
}

table ip filter {
  chain forward {
    ip daddr 10.1.1.112 tcp dport 8080 accept
  }
}

I want to simplify this using a map so that I can add services to the
map instead of having to copy all three rules every time. Something
like this

table ip nat {
  map dnat_services {
    type inet_service: ipv4_addr . inet_service
    elements = {
      http: 10.1.1.112 . 8080
    }
  }

  chain prerouting {
    ip daddr != 10.0.0.0/8 fib daddr type local dnat tcp dport map
@dnat_services
  }
...

would be great but it seems like the dnat target doesnt accept
concatenations. I get that this can be done with two maps but it makes
it quite ugly to write although there are performance benefits. Also I
have no idea what to do about the filter and masquerade rules. For
example

chain postrouting {
  ip saddr 10.0.0.0/8 ip daddr tcp dport map @dnat_services masquerade
}

doesn't parse (my assumption was this would have been that the ip
daddr would be the result of looking up the tcp dport in the given
map, it matches the dnat syntax)

So is there a cleaner way to write these rules using maps?

thanks,
Max
