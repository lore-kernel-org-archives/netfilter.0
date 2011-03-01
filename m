From: Daniel Nilsson <gnuffel@gmail.com>
Subject: question about hardware acceleration feature usage
Date: Tue, 1 Mar 2011 11:38:04 +0100
Message-ID: <AANLkTinQZ0O8GjZst=QideoAiotjWTsZO5493eJ9kMyZ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=oTU9u28TpY+QLuw4f96RRb8KitCGu5BRUHJuCp9VG74=;
        b=mdHCNm0+NokIg+0c+ZYK2WHqC3qrHCtKHc0nZTslLlGYccsolu22PiRLWWWtFJ5d78
         c0etczJs7t0dwlAI7PzDagDrQj8Vq+me3v4iD7pyzVPzz+FKLUd2usMQPU9RJFKZWJzZ
         3WrxvtuigV8vaCcTGpFkH1on52zec0hMdzpI4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am looking at choosing a processor for an application that will
handle quite a bit of packet processing using netfilter.

I have seen embedded processors such as those from Ubicom and
Freescale that have hardware support for filter processing, but I
can't find information anywhere if this is exploited in
Netfilter/Linux. Is there indeed any support for this kind of
hardware, or is all processing done in software on all platforms? If
there is support, is there a summary of supported chips?

Best Regards
Daniel Nilsson
