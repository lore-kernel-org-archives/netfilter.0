From: Reuben Martin <reuben.m@gmail.com>
Subject: Re: ipsets: examples?
Date: Mon, 20 Dec 2010 09:07:41 -0600
Message-ID: <201012200907.41439.reuben.m@gmail.com>
References: <201012192237.43878.reuben.m@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=Zb+qs2oErIJ4UNtwd2oRTul2HbqyuAgTOykVmWo+K2g=;
        b=agC1VUEIji3/4YCh2BSSBUcca2p6HWbS/3J4hSXxeG71nXovs/5iI3or5CIGuKLT6Y
         9N4jl6IziSudIa4QlfKoc2KqCLDTQtU3fBbliyEX8DAe08oWgLY3Rrr9E3NNol909RQa
         8qzVAmxapxV/wl5hNL8j4WyR6/uyL9RbNI9rg=
In-Reply-To: <201012192237.43878.reuben.m@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Sunday, December 19, 2010, Reuben Martin wrote:
> 
> I'm trying to put together an extension to forward udp packets to an arbritary set of destinations using ipsets. Specifically I want the extension to be able to take either an ipmap or iphash as a set of destinations for the forwarded udp packets. (I'm starting with the rawdnat, stripping out the tcp code, and changing it so that it duplicates the packet as needed for destinations instead of changing the dest address in the origional packet.
> 
> But I'm having a hard time finding code examples of how to use ipsets. How do I take an ipset as an argument for an extension? How do I test the set type to make sure it's an ipmap or iphash? How do I iterate over the set? Is it an array, linked list, etc?
> 
> I've only been poking around for a couple hours with the xtables code, so I am by no means very familiar with the API.
> 
> -Reuben
> 

Or, am I perhaps mistaken assuming that ipsets provides an api for other extensions to use sets as a dynamic target?
