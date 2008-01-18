From: "Sarath Kamisetty" <sarath.kamisetty@gmail.com>
Subject: flow aging
Date: Thu, 17 Jan 2008 16:18:11 -0800
Message-ID: <641e6aa90801171618r572119eq79eae359e143fabe@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=9ztYEdmyOBzuL1gE67CWrhK8MFXL6xCr7hGtsjJ02w4=;
        b=guNn8sHcV+WlODR/CSSo3NYtyc6apAqsa9xsFcEgk4aCeEZSAP3wGQJcj/OHq0Xlt82466FGjqEE/3W3n3V/cg+dIQc2sXWlTMnCkGLgmRddUaEVq1ZUVA52nYpJU/WRf67GibY540nx5EWsivf8qmIP0PWJEVuMoJLD6z9nUBk=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

How does flow/connection aging work with netfilter ? When a UDP/TCP
connection entry is created in ip_conntrack when does it get flushed ?
Can you please point me to some documentation on this if any ?

Thanks,
Sarath
