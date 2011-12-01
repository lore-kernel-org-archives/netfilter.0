From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: How to drop an idle connection with iptables?
Date: Thu, 1 Dec 2011 12:22:25 +0200
Message-ID: <CA+4D1sfSu77cv_b5R0R_SULDpGX-9i70AuxBguAqOcrN1EpWiw@mail.gmail.com>
References: <4ECCCF70.1080701@gmail.com>
	<jaipdd$irr$1@dough.gmane.org>
	<4ECE125F.8090101@gmail.com>
	<jal9sa$t42$1@dough.gmane.org>
	<4ECF299D.9040005@gmail.com>
	<janteh$3ui$1@dough.gmane.org>
	<4ECF9C17.80804@gmail.com>
	<4ECFA41F.50105@oldum.net>
	<4ED0CE43.2060505@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=0oRz/UpfVGo4ev4bClanaTQjKhI98n6m/O63F/LwsoY=;
        b=O5n7qgwh+qC2ZvujfoRNIoejPdPyFzavK5usPGXdPpR7bKgWtbcoVEwehScxwHQ1Fp
         2zJ1XpYUndrYTr4CKgIbv3zLgzq/BtJjW+GoJ2WpE4N8ymFVMK6QZw9jBXamrlioW7VL
         OziWa7ORtRuVk0dY9QBFcp75Ix6aRGSJqV0qs=
In-Reply-To: <4ED0CE43.2060505@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lu zhongda <luzhongda@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Lu,

I suggest trying to drop invalid packets:
iptables -I INPUT -m state --state INVALID -j DROP
iptables -I OUTPUT -m state --state INVALID -j DROP

Using with echo 0 >
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_loose and little
connection timeout may solve your problem.

-- 
Best regards
Anatoly Muliarski
