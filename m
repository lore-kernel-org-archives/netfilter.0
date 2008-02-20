From: "Eugene Polyanichko" <messiah@nline.net.ua>
Subject: Re: conntrack "invalid parameters" error
Date: Wed, 20 Feb 2008 19:06:58 +0200
Message-ID: <000801c873e3$01c8dad0$0201a8c0@stealth>
References: <003901c872f9$915921e0$0201a8c0@stealth> <47BAD7FB.8040709@netfilter.org> <005401c872fc$eebce120$0201a8c0@stealth> <47BADFFE.3050203@netfilter.org> <008101c87300$d398f470$0201a8c0@stealth> <47BAF390.3050309@netfilter.org>
Reply-To: "Eugene Polyanichko" <messiah@nline.net.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Yeah, that was the reason. I've checked it and found, that this parameter is 
experimental, so that's why I've missed it. Thanks a lot for your help. I've 
recompiled kernel and now it works fine!


> Pablo Neira Ayuso wrote:
>
> Is CONFIG_NF_CT_NETLINK=y or ...=m in your .config file?
>

