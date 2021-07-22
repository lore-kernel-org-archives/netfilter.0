From: pauloric@contatogs.com.br
Subject: manual : CONNTRACK EXPRESSIONS
Date: Thu, 22 Jul 2021 16:57:37 -0300 (BRT)
Message-ID: <328573485.4.1626983857363.JavaMail.zimbra@contatogs.com.br>
References: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62> <20210331214053.GB13699@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 mercurio.contatogs.com.br 7D4FD4005B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=contatogs.com.br;
        s=547D7A06-2322-11E9-835A-A37390E63B7D; t=1626983860;
        bh=U6/x5QU/MRvHaWvkyte92w3GoFNkPBOOFiqVVXCcbN0=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=c6btFX0pgT9RpgxkpGdXKyRLWZolUW7QeWzQ+ISEqchboTm3jXrGBQKl+OCpphkGz
         UeSWQDncQ7hLvM1aXYjAkY9264VHHYsTAmG2qL/0iqi3AjLKwRBglt2uR6A830GSSz
         GFdhv5wtXHTy9jQgSLjluhqNsUhZaxqWm8RmbOI+Nupgkh4cYdIDAnxjs5U22ZAGYw
         syMEwfeHiphgLX+nLAdTA+Y9v7xpVHel14Izf2wcCH1O6MHF37kfOUSrIeFSuul/lr
         h1xwhsdJd8qakzpRjodHWJwhYEkkLBmLX6xkotBknA5w/TAvBNK8C6B+wbvUL7BNvL
         LfqKFbbBBYadA==
In-Reply-To: <20210331214053.GB13699@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi

Near  CONNTRACK EXPRESSIONS at manual I think that should be good to insert something like:

ct {state | direction | status | mark | expiration | helper | label}
....
ct count [over]    <-------

and just a little bellow it has already an example of it.
...
filter input tcp dport 22 meter test { ip saddr ct count over 2 } reject

Maybe a include at Table 55. Conntrack expressions  too ??? <----

Could it be inserted at https://wiki.nftables.org/wiki-nftables/index.php/Quick_reference-nftables_in_10_minutes#Ct    ???

best regards


-- 
Paulo Ricardo Bruck consultor 
