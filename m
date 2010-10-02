From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Sat, 02 Oct 2010 21:35:23 +0100
Message-ID: <4CA7978B.9020900@googlemail.com>
References: <4CA5091B.1090200@googlemail.com> <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu> <4CA5C48E.9010603@googlemail.com> <alpine.DEB.2.00.1010012302530.19869@blackhole.kfki.hu> <4CA70B3B.90001@googlemail.com> <alpine.DEB.2.00.1010022104571.23216@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=NDpYhL0dI3El0gufe9UhAai0QzBpSKN6xbi05UrTvtM=;
        b=TuAt4ICWSDGaE35p+louCs1uvdxAPA235RhZnZxcRs/EzfRNDXsVKFzhUTZ/QeWjj6
         YylIERzoOSJde6XP+GvlDraRyApB+5brT65GT46yhcAkq5ksLfo3fFGeANCqEzsYB5K4
         gLUVviKhEVC9HBo1Y34cx+auVdVr45nMAgK0I=
In-Reply-To: <alpine.DEB.2.00.1010022104571.23216@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

OK, I quickly tested the new version with my previous test on the ssh 
port and it all works now, though I found some other (minor) issues:

When I do 'make IP_NF_SET_MAX=xx IP_NF_SET_HASHSIZE=xx' and then do 
'make install' (as root) both values I have given during my first 'make' 
were completely disregarded.

If I do 'make IP_NF_SET_MAX=xx IP_NF_SET_HASHSIZE=xx' and 'make 
IP_NF_SET_MAX=xx IP_NF_SET_HASHSIZE=xx install' I can see that at least 
the default hash size has also been disregarded (built a set without 
specifying --hashsize and when I executed 'ipset -L' the hashsize was 
1024 and not the number I have given during make). I cannot check 
whether IP_NF_SET_MAX has also been disregarded (don't know how to do it!).


Is this a known issue or have I done something wrong?
