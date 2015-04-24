From: Miroslav Kratochvil <exa.exa@gmail.com>
Subject: nftables type for ipv4_addr -> packetmark map?
Date: Fri, 24 Apr 2015 19:25:42 +0200
Message-ID: <CAO0uZ+8+M1_XZArgpbZZpQFcBsNztMkyp3-BVx7tUMkqz3YW2w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=YZPSmzPfTgKT6eRdCjO0VSPdV+XOh62cCPLyyzGb/I0=;
        b=WA/xiCHPWuCfF1yWQO2Oxy8+7wTQVL/nHdwcXcQFg2dsF7fEz7T1EHeB6OZ7clGhXZ
         RxlY+VWlIIV8aSjNlsXhMVR31NN1GO6zTBk7EEF3UBiVNka5i97pKRbubAXIlyo1GPr9
         H/ztrpgR4fxnt3Mhmu9iZsGfUagSPdxemrztfmldOUmaA3zYjMo6gsg7fZ/y03rRjyX5
         EEjC+4Gsse8hmGPuDickerGNtdZ8wTYukD5qrD8qzncBIYp0Q7NTY3/oE+oW4pZ+/QE5
         qoGAeQzENqT5IlK4AeH3yafzK5t2Pwdtgt5XJpJnRZe7YjoUvY0/X/gWsV7nR0zVL0yf
         JKqA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello list,

this is (probably) a very simple user question so if there's already a
solution available elsewhere, don't hesitate to send me RTFM with a
link or so.

The problem statement is really simple - I've been trying to create a
permanent, "named" map/dict using nftables that would be usuable for
similar marking like from this example:

# nft mangle output mark set ip saddr map {  192.168.0.0/24 : 0x1,
192.168.1.0-192.168.1.64 : 0x2, 192.168.2.1 : 0x3 }

Creating the map as any persistent object fails, because I'm unable to
find the name of the mapping type from documentation. So, for example,
this (packetmark type name taken from manpage) fails:

 # nft add map mangle mydict { type ipv4_addr : packetmark\; }
<cmdline>:1:42-51: Error: unknown datatype packetmark
<cmdline>:1:23-52: Error: map definition does not specify key data type

From nftables sources, it would be obvious to use "mark" type as
defined in `nftables/src/datatype.c' line ~687:

 # nft add map mangle mydict { type ipv4_addr : mark\; }
<cmdline>:1:42-45: Error: syntax error, unexpected mark, expecting string
<cmdline>:1:23-46: Error: map definition does not specify key data type

...seems a bit like quoting/keyword conflict parsing-related issue to
me, but that's a wild guess. What then is the correct datatype name
for ipv4_addr -> mark map?

Thanks in advance for any help.

-mk
