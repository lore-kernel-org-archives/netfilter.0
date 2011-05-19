From: Kelbel Junior <kelbel02@gmail.com>
Subject: Source MAC address through bridged connection
Date: Thu, 19 May 2011 12:52:30 -0300
Message-ID: <BANLkTikbqMrGCThuiFZRCtB6Mrf_+mcXNg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=r9pl0lDpD064x6cw19jeUiTGwm+jqzmis02/sZN6+ZU=;
        b=sLLk8ZDcm9UBr3EzxL7iB12Wgah9Hip9pWdO/hqOauisFfdwvWySRAeef5DRyadN8S
         E2n6C4oXuTtJEZVLd7wzF5JTeyL7glMzsJm8r/11YLI3+EWX8H0xuVeuPZyUC2w9Seag
         cX0lyQlZ+n3jexKWb9BugpZ7FEeBO8FYcCjL4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi guys!

I have the following scenario:

Clients Network <------> Linux router <------> Mikrotik gateway
<------> INTERNET

Happens what the Mikrotik gateway controls the clients from the mac
address (joining an ip to an MAC address) and when i put the linux
router between they the control don't works.
I saw on the MK(mikrotik) the packets coming in with the MAC address
from the bridge, and this is a problem.

Exist some way to preserve the source mac through a bridged
connection, to continue seeing the mac address of the clients?

--

Att.
Kelbel Junior
