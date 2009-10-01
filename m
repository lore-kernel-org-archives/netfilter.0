From: =?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?= 
	<javier.galvez.guerrero@gmail.com>
Subject: Mapping multiple interfaces to a single IP address
Date: Thu, 1 Oct 2009 12:30:09 +0200
Message-ID: <145d4e1a0910010330r216e68cch763b6c7a4b954992@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=TfgHmnEzf4iDTjer6X7ohtPOigAfMGtkErEjsuHxcJo=;
        b=fRF6IdjpXYp4ArxMIDG+qyQD9WPXdg2T2gf+kKl/Dof0fYAO+hbP7qIkRhYe44qOI1
         i6a3IjQaKNOemnX0rsUFXNbRYOUSl9cUsX+DBkO+TNMFpEkidgkhdpZIuynZpCQgY5XS
         6a9uyUSVQfiSraZeMv2mmbSU13IRV3k+sYrrY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

I would like to know if it is possible to map multiple network
interfaces into a single IP address in order to perform load balancing
and network channels virtualization/abstraction tasks. If so, could
you please point me to the proper iptables modules that are needed in
client and routing elements?

Thanks,
Javi
