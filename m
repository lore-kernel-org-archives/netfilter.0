From: "Peter Boughton" <boughtonp@gmail.com>
Subject: Re: simple connection bridging
Date: Sun, 13 Apr 2008 12:10:53 +0100
Message-ID: <5d97c170804130410p400d523bs118b8885b5c1548a@mail.gmail.com>
References: <5d97c170804121439m44ef9243r466dc7e106f0d947@mail.gmail.com>
	 <4801622E.1060407@bofhland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=Pbs297awaEHqGny46Ba7sdXqZycV6qfLI3/clfTxosU=;
        b=gibnVZ3m2YY0Pu2+Ac9qM89h0b3qgaYGQtwPVvXtARtuCq3z1LWq9O1nfgUTsSfIwiTwBtWeapuX+Q9lJusZ8RBJuOj1rvLwMSDZjJeH9iwIcRRWH8XWa0QkdesB0LcsP/hjmTrQzxaBblxcFC5mCgSTj4rlyHeWTm/qm+377jM=
In-Reply-To: <4801622E.1060407@bofhland.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: whiplash <whiplash@bofhland.org>
Cc: netfilter@vger.kernel.org

On Sun, Apr 13, 2008 at 2:30 AM, whiplash <whiplash@bofhland.org> wrote:
>  You don't need iptables at all.
>  Just enable packet forwarding on the linux box:
>
>  echo "1">/proc/sys/net/ipv4/ip_forward
>
>  and add appropriate routing rules on both Xp machines:
>
>  on 192.168.1.2
>  route add 192.168.0.0 mask 255.255.255.0 192.168.1.1
>
>  on 192.168.0.3
>  route add 192.168.1.0 mask 255.255.255.0 192.168.0.1
>
>  (I'm assuming both networks are /24)
>

Thanks! :)
