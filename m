From: James Bond <jb666531@gmail.com>
Subject: query re dynamic set and limiting
Date: Fri, 17 Apr 2020 10:38:04 +0100
Message-ID: <CAL-6i+VntVxOf2=c5HeY2aVGchB3MffYuvqYu4X6-PiezZm+XQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=gyukOvPrA+kzQqEFU25BcuhaOtiHtBhgxFjLnMXgVOg=;
        b=AsB+af5KVtpmUiHnFbt+MmEAw0707aogC4P7Mbeh1WPcnMfoOeGRRx6gx9g8h5tqx9
         tJK80jlD0nRZGYYmwgJuiMaem+aUKlj96N5IIlR5a4PHUO86xIHVBD7YMPL+QOslWT3z
         GlUMQDc1XtBWyR6DxHDOe/I0elszoX97BaI21yIqIyrE95M70ae22jIwMnN/n+WRfTTT
         GV4CQYadVkqBYQK66UG0G6FuKKFqEYi0274EGzMGn8ryrTf76TWCFsHKHs5wEzHXqo0R
         Ak0Y+deY0yEtF1tO0LQ2hTIIeP1Yyxzmp0stZWb2IkMBxB4AZn9W1JBXe3DY4r7TlAYz
         LnIQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi

Could you please tell me the difference between following 2 rules:
rule#1
nft add rule my_filter_table my_input_chain tcp dport 22 add
@my_ssh_meter { ip saddr limit rate 10/second } accept

rule#2
nft add rule my_filter_table my_input_chain tcp dport 22 add
@my_ssh_meter { ip saddr } limit rate 10/second accept


Kind regards
