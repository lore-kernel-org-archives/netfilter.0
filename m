From: Simon <turner25@gmail.com>
Subject: undefined references when linking
Date: Sun, 22 Jun 2008 13:57:33 -0400
Message-ID: <485E928D.5010108@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=W7ewDKNMGs6mcOv0ghc5+gxyrR2SxBT7/kaXXKei8ZQ=;
        b=XC434TKCag1LvHPaHky31IDdC7QOkfGcnv+yw7XgdJOSqWXqgZMWMt1NBVyAu0tukA
         zNXR9AgV8Ttf631btQ1RAkOgBYTOugiIypKEmSG6vgGuMeIGgEGjK6I0zE72d3jIFXa1
         g5mKjrwLN4cvTx6PdBWcZBLJrTyjVIXVyJDss=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
   I'm new to this list, I'm new to programming with netfilter (though I've been 
using it on my linux installation for years) and I'm warning you that my 
programming style hovers between C and C++.  I do have a lot of experience at 
compiling with different libs, however this issue puzzled me quite a lot.

   I'm interested in the QUEUEing mechanism, so I downloaded the 
libnetfilter_queue source and found the example/test program.  I kept all the 
includes and basically made no important changes to it.  The libraries nfnetlink 
and netfilter_queue that are installed have been installed (and reinstalled) 
from the gentoo tree (which has been sync before doing so).  To my knowlege, all 
is good so far.

   When compiling all is good also, however at the time of linking I get one 
"undedefined reference to <some netfilter_queue func here>" for each func that I 
use.  I verified and the link is done properly, i mean the linker finds the 
library and reads it well.  The library it finds does contain the symbols (found 
with dumpelf, they are not UND).

   I'm wondering if this is a known issue you guys know of or if it would be a 
problem strictly on the side of gentoo?  I will try to recompile both libs by 
hand soon and see how that goes...  (but this will be a challenge since the 
Quebec's holiday is coming real soon, similar to the 4th of july but where 
people drink stronger beer!)

Anyway, thanks in advance for any help/pointers (to defined references!),

   Simon

PS:  Also, I have just one more question in mind, is that the packet that is 
examined by netfilter_queue is in fact the Ethernet frame, right? and its data 
would be, for example, an IP structure which in turn could contain a TCP 
structure and so on... but initially with netfilter_queue I'll be working with 
eth, right?
