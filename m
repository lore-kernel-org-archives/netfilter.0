From: "Curtis Wyatt" <zhackwyatt@gmail.com>
Subject: Queue all traffic...even if not destined for local machine
Date: Mon, 25 Aug 2008 19:26:09 -0700
Message-ID: <7915e7b50808251926j1ed07815k84ab2e1ca6cddb5@mail.gmail.com>
References: <6886667862162200006@unknownmsgid>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=fWdDU7oHjja4YBBPDAHMC25gPfSEghELa2XwNXZg3TQ=;
        b=JSDmTR3nRUsdAI00WjsupeCwzs3YGio66KUCncoF+Rbj2kkG2z0jk5r5mVs7wupwf1
         qGzxr5A75EYHUSN3xeQ+p3uqVXgmQoVF/EE7zsIEwiiVio80tFEoKHFMcv4uaEIXkaOF
         SVt2eTkHWqXvEJr4pv0TX9k6QG/n5YcyYz/ds=
In-Reply-To: <6886667862162200006@unknownmsgid>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello all, me again:


I have a box with two Nic cards on it. What I will be doing is taking
a packet coming in on one nic, encapsulating it, and then sticking it
on the other card. I know how to Queue traffic destined for that
machine (iptables --insert INPUT 1 --in-interface eth+). But how do I
get traffic not destined for itself? --insert FORWARD 1 doesn't seem
to work.

Do I need to look at promiscuous mode?

Thank you very much
-----------------------------
Curtis
