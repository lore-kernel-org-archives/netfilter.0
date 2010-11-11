From: "burek" <burek021@gmail.com>
Subject: iptables matching on TCP OPTIONS
Date: Thu, 11 Nov 2010 10:02:51 +0100
Message-ID: <CD6EC5F63390439D9D00C49D6913ADEE@misko>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:from:to:subject
         :date:mime-version:content-type:content-transfer-encoding:x-priority
         :x-msmail-priority:x-mailer:x-mimeole;
        bh=9o09Jro/OplUOBCMePeulKY7RoU6vdv64C+neaotTkk=;
        b=NEt5bgYA5lL932CbGfqflvBPuJ41O+T/gkJNGqYKNs19A0mxe/Xr0Njy9vYpkv6Ld4
         /XM39Nr9O0HvjMD2ixTeu2XbktE3R8EHFxJO8nCOrLf62YgMgVkAECKue4B/aBJXr6Ut
         fjRtmUJ9PutE5kFmjoZlE/YLOr35JdFx7Xl2M=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

Hi,

I've been trying Google for hours now, and had no luck with this :(

Is it possible to use TCP OPTIONS field ( 
http://en.wikipedia.org/wiki/Transmission_Control_Protocol ) to put a short 
string (text) in the tcp option area of an TCP packet (as a new, custom, 
option) and later match those packets with iptables using --tcp-option?

Are there any example out there that are explaining how to match a tcp 
packet, based on the custom option's value (short text that i'd like to put 
in it)?

Thanks to all who can help. 

