From: Julien Vehent <julien@linuxwall.info>
Subject: Re: QoS weirdness : HTB accuracy
Date: Sat, 22 May 2010 16:29:21 +0200
Message-ID: <e6bd0cff8dafc8b3af0760facb5fdc8c@localhost>
References: <067c83163988908ef546d7ff7f560a17@localhost>
 <4BF32BB0.7010700@redfish-solutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=linuxwall.info; h=
	mime-version:content-type:content-transfer-encoding:date:from:to
	:cc:subject:in-reply-to:references:message-id; s=lnw-dkim; bh=DH
	bjhf/rSlE9wrlJ2/ukASTadkFQH5iDHVass4Pb9oc=; b=AKnFO+25cJNgJg8v0I
	ki/Ax1tJlPwKZVUIiwL4j7GbH4E5i01cOouOq1Qu5assMDOhfKLFblfeGubYeb6T
	1dMBbERZUAidIE0PsY87jW5QULTaohOvcoq9BuQ+8h9/QS108FlWXa121uWtGv5F
	tMcpg7B4ef2hY7MSOK3hWlrUE=
In-Reply-To: <4BF32BB0.7010700@redfish-solutions.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Philip A. Prindeville" <philipp_subx@redfish-solutions.com>
Cc: Netdev <netdev@vger.kernel.org>, netfilter <netfilter@vger.kernel.org>

On Tue, 18 May 2010 18:07:12 -0600, "Philip A. Prindeville"
<philipp_subx@redfish-solutions.com> wrote:
> 
> Sorry for the late response:  could this be an "aliasing" issue caused
> by sampling intervals (granularity)?
> 
> -Philip

I was, in fact, an error in my ruleset. I had put the 'linklayer atm' at
both the branch and leaf levels, so the overhead was computed twice,
creating those holes in the bandwidth.

Julien
