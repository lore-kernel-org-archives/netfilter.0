From: Saikiran Madugula <hummerbliss@gmail.com>
Subject: Re: Cannot access to CVS server of Patch-O-Matic
Date: Tue, 29 Sep 2009 10:22:46 +0100
Message-ID: <4AC1D1E6.8020509@gmail.com>
References: <4ac1659d.20015a0a.15da.ffffe6ff@mx.google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=r1Jel9pbg4f4Dz1qwGKugHl59CRndGd7C9tcQ9uR7vo=;
        b=OD9G82NIPrAMKqx1dgKwQNDTiikjW2j5633L1tspdPbgnQhgdAAI/wlNqV9Hi3s/hq
         bCqeQZWqoCDonagrxFy8s2LgQ17mGNY78V6VY88CCbAw3YQ/Hkn+EXaUy1tjOgpNJNF8
         KcDiGrdq8n7TEy8cPE/0O5iNHac8KQX53qUDE=
In-Reply-To: <4ac1659d.20015a0a.15da.ffffe6ff@mx.google.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nguyen Anh Dung <serepok@gmail.com>
Cc: netfilter@vger.kernel.org

Nguyen Anh Dung wrote:
> Hi All,
> I'm doing firewall testing which is related to time-based features of
> iptables. As suggested from many sources, I try to use Patch-O-Matic to
> install that feature. First, I must connect to the pserver.netfilter.org

http://git.netfilter.org/cgi-bin/gitweb.cgi should have all the relevant
repositories. And patch-o-matic is replaced by xtables
(http://xtables-addons.sourceforge.net/).
