From: Reuben Martin <reuben.m@gmail.com>
Subject: Re: ipsets: examples?
Date: Mon, 20 Dec 2010 14:18:14 -0600
Message-ID: <201012201418.14281.reuben.m@gmail.com>
References: <201012192237.43878.reuben.m@gmail.com> <alpine.DEB.2.00.1012201622001.14191@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:message-id;
        bh=lE99xADNH3GquJrzpvRfl/AgckumxZb2f/bn3TmG2I0=;
        b=eo9Yz8SoE9TFUPEFdGtkg8GP2uTv195yYJ+/qJOmyHOKcv1PkeHCN4JV5CNuHbAx2r
         3X6ffyN7jm9hcendXjO95BQVslvPctjGaVxYK/Hos5v+R2ZjhKpjfpwpq6fbHU0Pq7D0
         q3yYiX3Ggsl3BCdAXS7EKkTOzvKmVSYAHkdXs=
In-Reply-To: <alpine.DEB.2.00.1012201622001.14191@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, netfilter@vger.kernel.org

On Monday, December 20, 2010, Jozsef Kadlecsik wrote:
> Hi,
> 
> On Sun, 19 Dec 2010, Reuben Martin wrote:
> 
> > I'm trying to put together an extension to forward udp packets to an 
> > arbritary set of destinations using ipsets. Specifically I want the 
> > extension to be able to take either an ipmap or iphash as a set of 
> > destinations for the forwarded udp packets. (I'm starting with the 
> > rawdnat, stripping out the tcp code, and changing it so that it 
> > duplicates the packet as needed for destinations instead of changing the 
> > dest address in the origional packet.
> 
> I don't really see why you need to embed ipset. Why don't you call it as a 
> normal match and use your extension as a target?
> 

I think I have misunderstood what can be done with ipsets. I knew you could use it as a match, but for some reason I though it had an API to allow other extensions to use sets as targets. (i.e. my intention is, as you suggested, to use the extension as a target)

Is there any way via the standard API to request the contents of a named set? That's really what I want to do. Basically for each packet I would request I want to be able to check what addresses are in the set named in the parameters of my extension, and then copy the packets to each of those addresses, and hence have a dynamic list of destination addresses.

If there is no such API would it be too hard to create one? It would be great to be able to access the sets as linked lists, while having ipset internally managing the locking so that something is not accessing the list while an element in the list is being added or removed.

-Reuben
