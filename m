From: benjamin fernandis <benjo11111@gmail.com>
Subject: cluster ip for heavy application
Date: Mon, 21 Jan 2013 21:41:31 +0530
Message-ID: <CAARrgqyA+=fkv2aRRaFMELnGKbZubiuwy_K-Kji0TVLDZOoDHA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=au7Yi0JHDs3GfygmQiopB95IsCl9xLTjTZWB42Uezrk=;
        b=kwVwoMLq6bX30m51T9KZKaLlsR2oHwFiRHMElRNAZ6Z3VVZo2Qy1rIxUFi2/dwQTji
         578qgGp2d5PjlBJzOfk9VFyKd+DhIQdnjryUjT8EkeR4jBLeLi8a8J8YwBZTnQNhdSt4
         khnoGxzTT4pcEP28K4DytUA8dTx6GPUxOnnD/Ko705Z9P7uQUh6Tu2uosbMLV6aYTg/x
         h1u8i5jDH1yfOCMjbLfUPgvD39kdWbJ3W063T6c87ReTE/cAW3t1QnFJxtC1QtiEmYB2
         6uhfXVmW20rtVhUsJr9aNeuPMScGIed2fdq3b5l2TMVJvjxECxgZE7GIF0TFDzPk68z9
         NQIA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

We have a requirement to configure active-active cluster solution with
two server which runs our parsing application and it accepts traffic
from other device.

Can we use cluster ip module for this requirement ? as we have very
heavy usage because data comes from network device is very high.

Or is there any other method ? Suppose if we do port mirroring on that
network device ( sender ) then how to do configure both server (
receiver ) as we are using udp protocol...?

Regards,
Ben
