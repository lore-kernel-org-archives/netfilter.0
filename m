From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: try to change os fingerprint
Date: Fri, 21 Aug 2009 13:07:56 +0100
Message-ID: <56378e320908210507te174de0x7f2ad1331929346f@mail.gmail.com>
References: <4A8E5BD6.5040904@infoservices.in>
	 <1250855388.6489.21.camel@jaspav.missionsit.net.missionsit.net>
	 <4A8E8C46.7080702@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=wQ6DSPMYHe52sxZ/mqB62+xtFfsfnvOb1V9mVWG+drY=;
        b=pz2L/BLupi9e/JeaJCN5EvALwJs0meKqbMItl/vvxr6wQlrx1RCJLdLrDnJTJh7cx2
         f3wrmALPIZ9EHQRGoQcIlbF3gm4b5Ov2lgXjOMp8aHAcPBBECDBzS+LBSMBceK5Q9aVr
         K5MyZ5Z3ibQC2mkzPDh71kLDZG/39XD5QkN80=
In-Reply-To: <4A8E8C46.7080702@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

2009/8/21 J. Bakshi <joydeep@infoservices.in>
>
> I am not very sure but maybe we need to patch the kernel. Any clue from
> anyone ?
>
>

The package required to change the IP personality can be found here...
http://ippersonality.sourceforge.net/

Follow their directions and your distributions module build process to
make sure you have the required modules/user space libraries (if
needed) compiled and working.



--
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
