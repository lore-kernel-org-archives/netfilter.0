From: Julien Vehent <julien@linuxwall.info>
Subject: Re: QoS weirdness : HTB accuracy
Date: Thu, 25 Mar 2010 22:50:53 +0100
Message-ID: <7fff3360eb8e6fd57ed3641d87c1293e@localhost>
References: <067c83163988908ef546d7ff7f560a17@localhost> <20100325193140.1593fd51@catlap> <9661da2402edd9880c000f38833ea360@localhost> <20100325203630.30cf2254@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=linuxwall.info; h=
	mime-version:date:from:to:cc:subject:in-reply-to:references
	:message-id:content-type:content-transfer-encoding; s=lnw-dkim;
	 bh=hbnmN1BBHZRoe5W7K6VSNa3x/tblQ/qKEqijHWg41qk=; b=ewQzimOs4mDD
	Rja4OY9uX3U87NBcH3gtBZ0yRciH5LYO+wwrzYt7jLcYh4jbGe2b5i45Tgr+ADT9
	KiXdFVvslss297uOgviZhbsyPjVkZNuvCq6DCUUxKWIddMqNgFX6ROQtJ7cOtcO2
	pum5ONYYPn7xpu2PhGltGVf5dMTe/68=
In-Reply-To: <20100325203630.30cf2254@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

On Thu, 25 Mar 2010 20:36:30 +0100, Marek Kierdelewicz <marek@piasta.pl>
wrote:
> Hi,
> 
>>From my point of view, it looks like class 20 is borrowing, so the
>>other classes are not authorized to borrow whatever is left.
> 
> How do you measure the bandwidth consumed by each fraction of traffic
> that you visualise on image? Are values gathered from iptables rule
> counters?

Nope, I parse tc command line output with a perl script, get the 'rate'
value for each classe, multiply it by 8 to have it in bits and not bytes,
and insert it into a RRD database.

script is somewhat similar to this
http://jve.linuxwall.info/ressources/code/tcparsestat.pl


Julien
