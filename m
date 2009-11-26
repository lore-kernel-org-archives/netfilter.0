From: Saikiran Madugula <hummerbliss@gmail.com>
Subject: Re: An ping issue on Linux kernel 2.6.25
Date: Thu, 26 Nov 2009 11:14:30 +0000
Message-ID: <4B0E6316.7060104@gmail.com>
References: <fa33c8ee24ace.24acefa33c8ee@huawei.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=cz9FNKhADi40ioF2HVLJcUdkxWGT+fCqcRAYbSq6vDE=;
        b=WvbaAtHGLYVKWatVdwupkPxbR3/y7oq4PFqYRFEjX0wJFS1w4eq5Hwp6CcSSIOWdGW
         liZXULa7RdL9qqyRDqbxZoCTtkIpfbS7W6XT3ib6XsOcxhDGtOEsaLTD+E+9w2QIJTep
         Y0iKAwWqPjybgGnn3b6wwT9wpIrbdMTH2GgCI=
In-Reply-To: <fa33c8ee24ace.24acefa33c8ee@huawei.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jiazhida 00102231 <jiazhida@huawei.com>
Cc: netfilter@vger.kernel.org, vivianpu@huawei.com

jiazhida 00102231 wrote:
> Dear Sir:
> 
>   I have met an issue about Netfilter. The version of my Linux kernel is 2.6.25.
> 
>   Connect to the internet, and then open the command prompt and ping using "ping wwwlclix.pt -t". In the beginning I can get respose but after disconnect and connect the internet never responds again, but if I try to open the site in the web brower it works.
> 
>   I have checked the nf_conntrack table, it seems that the nf_conntrack item for icmp had not been updated.

If you are talking about packet and byte counters being 0 in reply direction
then it might be a bug that was fixed after 2.6.26 kernel. Check commit
718d4ad98e272daebc258e49dc02f52a6a8de9d3.
