From: Terry Burton <tez@terryburton.co.uk>
Subject: Disabling conntrack on an interface
Date: Thu, 2 Jul 2009 16:10:09 +0100
Message-ID: <2d1f9a6b0907020810x49f483a9j855d373b776571c6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=0nl6lZs+t46/E0BuaSC6kvz5X/ASeEOHgWcsqEgFdiY=;
        b=NmOsxnP6zazfqjjlI+3yY1x8N28ZAPVWt9t+Pv8Ixv/kARsrTMHC6epqG3k8URHw8p
         6QfwidAPTFD4+ysFSUF4PPVuR05wVv0G1HlwQzBzeUedGObqp3Km6CwyVLx+DF6VURFV
         vwiSjvt8A0nU0g45EB1VtXizoPXuUB4Log2LY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

Is it possible to disable connection tracking for a specific interface/bridge?

The particular scenario is that I have a secondary interface that
collecting the traffic from a SPAN/mirror port on a busy router. This
interface is enslaved into a bridge along with the virtual interfaces
of a some analyser virtual machines, using setageing=0 so that the
frames are forwarded to all VMs.

I would rather not have the traffic that originates from the capture
interface hitting the connection tracking code, if possible.


Warm regards,

Terry
