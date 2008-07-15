From: "Curtis Wyatt" <zhackwyatt@gmail.com>
Subject: ipq_get_packet returns wrong data_len value
Date: Tue, 15 Jul 2008 15:07:30 -0700
Message-ID: <7915e7b50807151507m3d1ccadfub7cf1882817c72ca@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=KZCZWXADY0IobJFpEyjs890EoQxBJHEG7g/b9OLtufQ=;
        b=RJM9ZkDTfmnN0/yvTYOp+W/BaCcC2NZHwoEqbZfsS5b52tlUPe+PXCxL8nwNrNw13L
         6xpjqBqWsoRpbTLEsrECvXWSfv5Wz3j9Jp875rCViSeVFHMpjH6vtDNqzLebwo+otrqZ
         asjKpVccUWoCrodn+2uwJV9idSf9SWLAc7zHc=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hey guys,

I'm new at this, but does anyone know of a case where ipq_get_packet
would return a data_len value of 671088640.  I have a toy program that
works just fine.  However, when I tried to copy it into another
program I receive these kinds of data lengths.  The buffer is returned
w/ the packet contents correctly, but I can't look at it because I
don't know how big it is, because of the corrupt data length.  Any
suggestions?  Thank you.
-----------------------------
Curtis
http://gocalipso.com
