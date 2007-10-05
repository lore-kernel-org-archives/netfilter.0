From: "Srinivas Murthy" <codevana@gmail.com>
Subject: ipchains to iptables
Date: Thu, 4 Oct 2007 17:18:59 -0700
Message-ID: <df1bdeb10710041718x13e2b796ofe45fbf30b4188bf@mail.gmail.com>
References: <df1bdeb10710041630nbd8a8e6uf63b6faacf1c4e5a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
        bh=EYkppi1FS7QpE28kXjVxWnvrQad4bts+5g1oiBfMG2M=;
        b=t2JRAXXe6WFaMu4N9O0rQEVFNNxT4qb1N6DcEBavR3qLCkfaiNoI0l3U3xCb3CyMuygxP0i1QgSoJ+7l5y0/wLrqNmu/hhkKhBiFEIZTKGPa4HRbXlNnb1EEqxoo17d3QK3SOi9kT8ZrMt0CjtA3zNUHkDj/+cRXy9M4jDeLmSo=
In-Reply-To: <df1bdeb10710041630nbd8a8e6uf63b6faacf1c4e5a@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

 I need to migrate from using ipchains to iptables in our linux 2.6.10 kernel.

 In addition to setting up rules for classifiers, nat, etc. using the
user space ipchains and also kernel space calls (using the ip_fw_ctl()
interface). We need the kernel space invocation since we do some
kernel space work w/ packets wo any user-space awareness or context.

 What is the equivalent interface to use in kernel space to use iptables?

Thanks.
