From: Rod Salazar <rodrigos@fb.com>
Subject: netfilter ipset c library
Date: Thu, 4 Apr 2013 22:53:28 +0000
Message-ID: <92C204D2E11A6949B84DB21D4194129316F6FDA0@PRN-MBX02-3.TheFacebook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fb.com; h=from : to : subject : date
 : message-id : content-type : content-id : content-transfer-encoding :
 mime-version; s=facebook; bh=mRXtJ+KgFX9xW2nYeBlZhwoN3m55koUX5bjKPz2OE5Q=;
 b=h1ePWEeTjHk8cS3TzOoJTgvWpctR+Jv1kKod6UsdmuZW7l8jIqgW/t2i0+yJ3UtC10pG
 h3Kx5cy8prNK8C99FSF8OqC8uyY+eDUd+SU8jXIiy0Q28/bdJBzdhfW/2TYb1PBkLHn4
 /3dp/KZK6bDtdgx67uo6KErOnUwIKki//sM= 
Content-Language: en-US
Content-ID: <069B1E4F8881EE448549C7894CA3894E@fb.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Is there anyway to modify ipset sets programmatically? I'm looking for a
way to add and remove ports to an ipset through my userspace app. Is the
only solution for me to modify the ipset command line tool so I can use it
within my app or call system("ipset ..") ? Even modifying iptables rules
themselves would suffice if there were a way, any ideas?

- Rod Salazar

