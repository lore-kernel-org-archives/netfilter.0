From: Ken-ichirou MATSUZAWA <chamaken@gmail.com>
Subject: logging rule ID
Date: Tue, 25 Aug 2015 13:57:20 +0900
Message-ID: <20150825045720.GA3073@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=I9AQXpE/wNkfIin/RDoqh98Suxa0ofcsuFKMdltlphw=;
        b=GNLhuhvQMca/TZk2bUPBYQI5tzSyiH6b8z7tzs5DYogK8rLKXGh1/Pftdu61FBft5Z
         vG/0cH+MYZNVJq18s5J9pS0cTYAag3RoEyLwy+w5I0cFk+I4joY9e2ZqYXEvv0N5sHS7
         Vz4V50AmZgA36vrzz6jeBT4au37V2+tbNUClJbAKkwnKswoh8KbHt0XhtpCS7tlvulUP
         iw9ZoOd/VfGIDYZGWl/N7YIlOYBQTkwnT2wwCDot9yBMdM0GLelXbpxwNVo5rWbgMrZ7
         TaMYF4MSZfTvcAj389dy82cZxJUE8v4hqPGb5wiZIoDFWuILUNfc5aGOGkI8QgiPZHNM
         VfeQ==
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

 Hi,

We manage firewall appliance products. A few of them can log not
only packet information but also log which rule number or rule ID
causes to log. I know nflog can do so by specifying log-prefix but
user must keep the uniqueness, it seems troublesome.

Based on it, how about passing systematic id to nflog? I think one
of a way is introducing holder struct like

    struct nft_rule_key {
         char *chain_name;
         u64  rule_handle;
    };

and add it to struct nft_pktinfo member. A Rule identifier --- chain
name and rule handle number --- can be passed to eval() callback by
setting those in nft_do_chain()::nf_tables_core.c before calling
eval() callback.

But I don't know whether this way adapts to the whole nft design or
not. And it seems that big change will be needed after passing
nft_rule_key to nft_log_eval().

Then, please let me ask three questions:

* Is there a way to identify the rule which rule outputs log without
  log-prefix?

* Is there a plan to identify the rule from log?

* How do I progress in nft_log_eval() if this method, passing rule
  identifier to nflog_log_eval(), can be acceptable?

Thanks,
