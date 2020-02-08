From: Nico Schottelius <nico.schottelius@ungleich.ch>
Subject: Netfilter state synchronisation in IPv6 only networks?
Date: Sat, 08 Feb 2020 23:22:43 +0100
Message-ID: <87d0aora6k.fsf@ungleich.ch>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
        t=1581200563; bh=E2c6D2G56qXWAfE3CE2gbIwQ4xmXZePdlYeuAa9TOtI=;
        h=From:To:Subject:Date:From;
        b=lWT3slQiFrvHWLfKAcehius1HgwNOMGc5hE7YtEKiPtTiCvDbTwjgAD58KmJaHijs
         ZUDSSsZc7XX+EZnSFuruHi4IPb+tNQTbxA847vjVRGTVq5u7mXpDOVC50FKkbbvsyU
         x7APa/HlTZlZRQlhkFNCdsTkmCN47AziG66Kw199Xm39++lO7cFtDrDxeGmMmQ4FM+
         YGEodimBXR0TXIAz0LtfYdrwr50KZSeYSK2PNsejSah6mCIYv4hf2giXe19efMshfi
         2gHBBucKzWEB3R0ELzhM3uIRvFAmLDZjXFa6H05BbgXyiuLJVXPbpx5iAgG1MUB4it
         +8PytHd4jGyTw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


Good morning,

as conntrackd seems not to support IPv6 only networks for exchanging
states, is anyone aware of any other tool that can synchronise
active/active or active/passive firewalls via IPv6 only networks?

Best,

Nico

--
Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch
