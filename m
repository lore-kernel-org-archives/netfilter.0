From: Jamal Hadi Salim <jhs-jkUAjuhPggJWk0Htik3J/w@public.gmane.org>
Subject: ANNOUNCE: New Talk: Story of a Network Virtualization and it's future
 in Software and in Hardware
Date: Wed, 15 Mar 2017 08:28:40 -0400
Message-ID: <a08ffed4-7ae7-68c3-4ebb-296346241469@mojatatu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=C+CkIUpsw8n3wJ3c7QWHYLNdjmBb+E4RWGdUydyuY58=;
        b=LybJfsOUMl+W46TptC/LVdQnjVwZZvn6gHmByJLXLej6HpHURL38HZMzo+PPZJyoiM
         Wndn0jkjN8UwGDJuqUU4sqMJF9+2QmWdAVYkbah5n2Klm6mwbC1cc0CG3YK+lbwtA9nZ
         V6kXf2VXQJ3tuUJky4dlp5eglqYUUQyMLmDds1j419l/2QTCx8zawIAgPLSnE1y5bOiY
         n3dhz9DL3rNcnpuvih8CNVnqvdktSep73smdMCKk9fGcIlXpi9nvDookHSNCOIQDVB/p
         s9vuNYhYIuckJW8ytb2CE+ssX9vjSrJYnPbWFjuwp8NeBgrWH6hm8AcgGDrZ4z9ISzb0
         iYIQ==
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: people-Aq7fehzYRUagpaxmtUs7hg@public.gmane.org
Cc: tech-committee-Aq7fehzYRUagpaxmtUs7hg@public.gmane.org, netfilter-devel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brenda Butler <bjb-jkUAjuhPggJWk0Htik3J/w@public.gmane.org>, Stephen Jaworski <jaws-jkUAjuhPggJWk0Htik3J/w@public.gmane.org>, netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heri Muhero <hmuhero-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

The tech committee would like to announce a new accepted talk from
Anjali Singhai Jain along with
Alexander H Duyck, Parthasarathy Sarangam and Nrupal Jani

The details are as follows:
-------
The paper and the presentation will quickly go through a time lapse of 
Network virtualization as it evolved, successes and failures and the 
reasons behind those. Revisiting history and understanding the present 
and future use cases for Network virtualization will fuel the future 
Hardware and Software designs for a better end user experience and 
pushing the envelope on Network virtualization. Intel and the industry 
has seen many generations of Network virtualization.

The talk will be focused on two important areas:

     Briefly Analyze the past and present
     Make a case for the future technologies

The talk will go deep dive into HW challenges in two areas of Network 
Virtualization:

     Why the Hardware offloads and getting them just right is important 
(Goldilocks effect), may be SRIOV is little too much.
     Host interface exposed by a network Virtualization device and how 
do we get that just right

The talk will also cover what the future SW model for Network 
Virtualization is shaping up to be

     The best control and data plane split that works for Network or 
compute intensive VMs/Containers.
     Why less is more in some cases for the Virtual function device.
     Is true SR-IOV a good answer in all cases, are Mediated devices a 
better compromise

To conclude we will go over the upcoming Virtualization technology 
supported by VFIO Mediated devices and PCIE specification for PASID, 
what problems will that solve. How do we get the software model right in 
this case and learn from our mistakes with SR-IOV.
----

cheers,
jamal
