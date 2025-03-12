Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CF21DFF7
	for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 16:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741796008; cv=none; b=NZaR82aNgLxB4JkEd7MvMqNJ17YYyuZ6WSsiXMTOM9SdlqVCcklO9UvvLT8CXRnUW4DWXRtN38xcx5ck8hRvAEBBuWdaegbHMOJyXqZsqowIgk93Bf6lbAzWIC0E7j1mPpS6GlpzlwxU6mi7a0T195AjlHXz6wzfF86BrNPrfb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741796008; c=relaxed/simple;
	bh=OZcdBU8tq5GGPuRV/su4N3mMQsZpmu38kgPhhyfrZio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBsOSswT5zpbNfXj3amoqfHg1qb/4zASqwXDVzGeIHL1IfjeV7+4VfmB1nbA2sQPUu0QS+ZoJOO9Zt/v4IMYRcINPIhFvUOmodDeRZ2Ztv2IcZIFg/5Z9NOgxbI3OW3XEUQbioS50N6t2XWUEmsLtkMb1hKLd2+rjlnjgiT2KIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tsOhw-000863-Ff; Wed, 12 Mar 2025 17:13:24 +0100
Date: Wed, 12 Mar 2025 17:13:24 +0100
From: Florian Westphal <fw@strlen.de>
To: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: netfilter expected behavior for established connections
Message-ID: <20250312161324.GB28069@breakpoint.cc>
References: <CABhP=tYOynShd82rwVuDMJDTE8LcM6+FHwx7Tfuk183EW+ipPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABhP=tYOynShd82rwVuDMJDTE8LcM6+FHwx7Tfuk183EW+ipPA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> I'm puzzled trying to understand the following behavior, appreciate it
> if you can help me to understand better how this works.
> 
> The setup is like this:  Client --- Router --- Server
> 
> - Router DNATs to a Virtual IP and Port of the Server.
> - Client establishes a permanent connection to the Virtual IP.
> - Router adds a REJECT rule in the FORWARD hook for the Server IP
> 
> I expect the REJECT to match the established connection, but the
> client keeps reaching the Server using the existing connection.
> 
> The packets of the established connection do not show up on the traces
> using nftrace.
> 
> Is it possible to "DROP/REJECT" the established connection ?
> 
> I've created a selftest to reproduce this behavior, please find it attached.

Are you sure this script works as intended?

Doing:
socat tcp-listen:12345,fork PIPE &

socat PIPE:P tcp:127.0.0.1:12345 &

echo foo > P

... causes endless traffic, since listener echoes
P back, that gets written to P, socat reads from it,
eches foo to server, that sends to client, ...

Probably you need to use:

socat -u PIPE:P,rdonly ... ?

This config change is also needed:

--- a/tools/testing/selftests/net/netfilter/config
+++ b/tools/testing/selftests/net/netfilter/config
@@ -81,6 +81,7 @@ CONFIG_NFT_NUMGEN=m
 CONFIG_NFT_QUEUE=m
 CONFIG_NFT_QUOTA=m
 CONFIG_NFT_REDIR=m
+CONFIG_NFT_REJECT=m

since thats the kernel feature template used by the netdev ci to
build the test kernel to use.

Another issue: cwd might be readonly, so creating pipe.test will fail.

I suggest to use
pipename=$(mktemp -u)

so the named fifo is created in /tmp which is writeable.
