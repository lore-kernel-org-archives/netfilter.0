From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack "invalid parameters" error
Date: Tue, 19 Feb 2008 16:19:44 +0100
Message-ID: <47BAF390.3050309@netfilter.org>
References: <003901c872f9$915921e0$0201a8c0@stealth> <47BAD7FB.8040709@netfilter.org> <005401c872fc$eebce120$0201a8c0@stealth> <47BADFFE.3050203@netfilter.org> <008101c87300$d398f470$0201a8c0@stealth>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <008101c87300$d398f470$0201a8c0@stealth>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eugene Polyanichko <messiah@nline.net.ua>
Cc: netfilter@vger.kernel.org

Eugene Polyanichko wrote:
> I see only "Netfilter messages via NETLINK v0.30.", can't find
> ctnetlink... I suppose, that's the reason, isn't it? Have I missed
> something in kernel configuration?

Is CONFIG_NF_CT_NETLINK=y or ...=m in your .config file?

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
